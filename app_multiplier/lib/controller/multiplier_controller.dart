import 'dart:convert';
import 'dart:io';

import 'package:app_multiplier/model/ano_model.dart';
import 'package:app_multiplier/model/carro_model.dart';
import 'package:app_multiplier/model/marcas_model.dart';
import 'package:app_multiplier/model/modelo_model.dart';
import 'package:app_multiplier/model/valor_response.dart';
import 'package:app_multiplier/service/multiplier_service.dart';
import 'package:app_multiplier/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiplierController extends GetxController {
  Rx<List<MarcasModel>> listaDeMarcas = Rx<List<MarcasModel>>([]);
  Rx<List<ModeloElement>> listaDeModelos = Rx<List<ModeloElement>>([]);
  Rx<List<Modelo>> listaDeModelosEAnos = Rx<List<Modelo>>([]);
  Rx<List<AnoModel>> listaDeAno = Rx<List<AnoModel>>([]);
  Rx<List<CarroModel>> carros = Rx<List<CarroModel>>([]);
  String modeloSelecionado = '';
  String marcaSelecionada = '';
  String anoSelecionado = '';
  MarcasModel marca = MarcasModel(codigo: '', nome: '');
  TextEditingController valor = TextEditingController();
  RxString valorCarro = RxString('0,00');
  var isLoading = false.obs;
  var carrosCadastrados = <CarroModel>[].obs;
  final String _key = 'saved_items';

  Rx<ValorResponse> valoresCarros = Rx<ValorResponse>(ValorResponse(
      anoModelo: 0000,
      valor: '',
      codigoFipe: '',
      combustivel: '',
      marca: '',
      modelo: '',
      mesReferencia: '',
      siglaCombustivel: '',
      tipoVeiculo: 1));
  Rx<CarroModel> carroCadastrado =
      Rx<CarroModel>(CarroModel(marca: '', modelo: '', ano: '', valor: ''));
  final service = Get.put<MultiplierService>(MultiplierService());

  Future<void> listarMarcas() async {
    isLoading.value = true;
    final response = await service.buscarMarcas();
    listaDeModelos.value.clear();
    listaDeAno.value.clear();
    valorCarro.value = '0.00';
    response.fold((error) => printError(), (model) async {
      isLoading.value = false;

      listaDeMarcas.value.assignAll(model);
      listaDeMarcas.refresh();
    });
  }

  Future<void> listarModelos() async {
    final request = marcaSelecionada;
    final response = await service.buscarModelo(request);
    response.fold((error) => const HttpException('Erro na busca'),
        (model) async {
      listaDeModelos.value.assignAll(model);
      listaDeModelos.refresh();
    });
  }

  Future<void> listarAnos() async {
    final request1 = marcaSelecionada;
    final request2 = modeloSelecionado;
    final response = await service.buscarAno(request1, request2);
    response.fold((error) => const HttpException('Erro na busca de ano'),
        (model) async {
      listaDeAno.value.assignAll(model);
      listaDeAno.refresh();
    });
  }

  Future<void> listarValor() async {
    final response = await service.buscarValor(
        marcaSelecionada, modeloSelecionado, anoSelecionado);
    response.fold(
        (error) => const HttpException('Erro ao buscar informações e valores'),
        (model) async {
      valorCarro.value = model.valor.toString();
      valorCarro.refresh();
      valorCarro.obs;
      valoresCarros.value = model;
      valoresCarros.refresh();
    });
  }

  Future<void> salvarCadastro() async {
    final prefs = await SharedPreferences.getInstance();
    final itemsJson =
        carrosCadastrados.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList(_key, itemsJson);
    // carroCadastrado.value = CarroModel(
    //     marca: valoresCarros.value.marca,
    //     modelo: valoresCarros.value.modelo,
    //     ano: valoresCarros.value.anoModelo.toString(),
    //     valor: valoresCarros.value.valor);
    carroCadastrado.refresh();
  }

  void addCarro(CarroModel item) {
    carrosCadastrados.add(item);
    salvarCadastro();
    Navigator.pop(Get.context!);
  }

  void removeItem(CarroModel item) {
    carrosCadastrados.remove(item);
    salvarCadastro();
  }

  Future<void> loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final savedItems = prefs.getStringList(_key);

    if (savedItems != null) {
      carrosCadastrados.value = savedItems.map((itemJson) {
        final itemMap = jsonDecode(itemJson);
        return CarroModel(
            marca: itemMap['marca'],
            modelo: itemMap['modelo'],
            valor: itemMap['valor'],
            ano: itemMap['ano']);
      }).toList();
    }
  }

  void mobcarDialog() {
    Get.defaultDialog(
      title: 'Reserva Efetuada',
      content: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Sua Reserva foi efetuada com sucesso!'),
      ),
      confirm: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black)),
        onPressed: () {
          Get.back();
          Get.offAll(() => const HomePage());
        },
        child: const Text(
          'OK',
        ),
      ),
    );
  }
}
