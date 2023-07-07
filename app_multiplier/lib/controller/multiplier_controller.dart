import 'dart:io';

import 'package:app_multiplier/model/ano_model.dart';
import 'package:app_multiplier/model/marcas_model.dart';
import 'package:app_multiplier/model/modelo_model.dart';
import 'package:app_multiplier/model/valor_response.dart';
import 'package:app_multiplier/service/multiplier_service.dart';
import 'package:get/get.dart';

class MultiplierController extends GetxController {
  Rx<List<MarcasModel>> listaDeMarcas = Rx<List<MarcasModel>>([]);
  Rx<List<ModeloModel>> listaDeModelos = Rx<List<ModeloModel>>([]);
  Rx<List<AnoModel>> listaDeAno = Rx<List<AnoModel>>([]);
  String modeloSelecionado = '';
  String marcaSelecionada = '';
  String anoSelecionado = '';

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
  late final MultiplierService service;

  Future<void> listarMarcas() async {
    final response = await service.buscarMarcas();
    response.fold((error) => printError(), (model) async {
      listaDeMarcas.value.add(model);
      listaDeMarcas.refresh();
    });
  }

  Future<void> listarModelos() async {
    final request = marcaSelecionada;
    final response = await service.buscarModelo(request);
    response.fold((error) => const HttpException('Erro na busca'),
        (model) async {
      listaDeModelos.value.add(model);
      listaDeModelos.refresh();
    });
  }

  Future<void> listarAnos() async {
    final response =
        await service.buscarAno(marcaSelecionada, modeloSelecionado);
    response.fold((error) => const HttpException('Erro na busca de ano'),
        (model) async {
      listaDeAno.value.add(model);
      listaDeAno.refresh();
    });
  }

  Future<void> listarValor() async {
    final response = await service.buscarValor(
        marcaSelecionada, modeloSelecionado, anoSelecionado);
    response.fold(
        (error) => const HttpException('Erro ao buscar informações e valores'),
        (model) async {
      valoresCarros.value = model;
      valoresCarros.refresh();
    });
  }
}
