import 'dart:io';

import 'package:app_multiplier/model/ano_model.dart';
import 'package:app_multiplier/model/carro_model.dart';
import 'package:app_multiplier/model/marcas_model.dart';
import 'package:app_multiplier/model/modelo_model.dart';
import 'package:app_multiplier/model/valor_response.dart';
import 'package:app_multiplier/service/multiplier_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MultiplierController extends GetxController {
  Rx<List<MarcasModel>> listaDeMarcas = Rx<List<MarcasModel>>([]);
  Rx<List<ModeloElement>> listaDeModelos = Rx<List<ModeloElement>>([]);
  Rx<List<Modelo>> listaDeModelosEAnos = Rx<List<Modelo>>([]);
  Rx<List<AnoModel>> listaDeAno = Rx<List<AnoModel>>([]);
  Rx<List<CarroModel>> carros = Rx<List<CarroModel>>([]);
  String modeloSelecionado = '';
  String marcaSelecionada = '';
  String anoSelecionado = '';
  TextEditingController valor = TextEditingController();
  RxString valorCarro = RxString('0,00');
  var isLoading = false.obs;
  var carrosCadastrados = <CarroModel>[].obs;

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
    carroCadastrado.value = CarroModel(
        marca: marcaSelecionada,
        modelo: modeloSelecionado,
        ano: anoSelecionado,
        valor: valorCarro.value);
    carroCadastrado.refresh();
    Navigator.pop(Get.context!);
  }

  void addCarro(CarroModel item) {
    carrosCadastrados.add(item);
  }

  void removeItem(CarroModel item) {
    carrosCadastrados.remove(item);
  }
}
