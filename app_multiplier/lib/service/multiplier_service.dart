import 'package:app_multiplier/model/ano_model.dart';
import 'package:app_multiplier/model/marcas_model.dart';
import 'package:app_multiplier/model/modelo_model.dart';
import 'package:app_multiplier/model/valor_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MultiplierService extends GetxService {
  Dio dio = Dio();

  final String urlBase = 'https://parallelum.com.br/fipe';

  Future<Either<String, MarcasModel>> buscarMarcas() async {
    try {
      final response =
          await dio.get('https://parallelum.com.br/fipe/api/v1/carros/marcas');
      final model = MarcasModel.fromMap(response.data);
      return right(model);
    } catch (e) {
      return left('error');
    }
  }
  Future<Either<String, ModeloModel>> buscarModelo(String codeMarca) async {
    try {
      final response =
          await dio.get('https://parallelum.com.br/fipe/api/v1/carros/marcas/$codeMarca/modelos');
      final model = ModeloModel.fromMap(response.data);
      return right(model);
    } catch (e) {
      return left('error');
    } 
  }
  Future<Either<String, AnoModel>> buscarAno(String codeMarca, String codeModelo) async {
    try {
      final response =
          await dio.get('https://parallelum.com.br/fipe/api/v1/carros/marcas/$codeMarca/modelos/$codeModelo/anos');
      final model = AnoModel.fromMap(response.data);
      return right(model);
    } catch (e) {
      return left('error');
    }
  }

  Future<Either<String, ValorResponse>> buscarValor(String codeMarca, String codeModelo,String codeAno, ) async {
    try {
      final response =
          await dio.get('https://parallelum.com.br/fipe/api/v1/carros/marcas/$codeMarca/modelos/$codeModelo/anos/$codeAno');
      final model = ValorResponse.fromMap(response.data);
      return right(model);
    } catch (e) {
      return left('error');
    }
  }
}
