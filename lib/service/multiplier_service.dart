import 'package:app_multiplier/model/ano_model.dart';
import 'package:app_multiplier/model/marcas_model.dart';
import 'package:app_multiplier/model/modelo_model.dart';

import 'package:app_multiplier/model/valor_response.dart';
import 'package:app_multiplier/webclient/custom_dio.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class MultiplierService extends GetxService {
  var dio = CustomDio().instance;

  final String urlBase = 'https://parallelum.com.br/fipe';

  Future<Either<String, List<MarcasModel>>> buscarMarcas() async {
    try {
      final response =
          await dio.get('https://parallelum.com.br/fipe/api/v1/carros/marcas');
      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          final marca = data
              .map((objetoJson) => MarcasModel.fromMap(objetoJson))
              .toList();
          return Right(marca);
        } else {
          return Left(data.printError());
        }
      } else {
        return Left('Erro na solicitação: ${response.statusCode}');
      }
    } catch (e) {
      return Left('$e'.toString());
    }
  }

  Future<Either<String, List<ModeloElement>>> buscarModelo(
      String codeMarca) async {
    try {
      var response = await dio.get(
          'https://parallelum.com.br/fipe/api/v1/carros/marcas/$codeMarca/modelos');

      final model = Modelo.fromMap(response.data).modelos;

      return right(model);
    } catch (e) {
      return Left('$e'.toString());
    }
  }

  Future<Either<String, List<AnoModel>>> buscarAno(
      String codeMarca, String codeModelo) async {
    try {
      final response = await dio.get(
          'https://parallelum.com.br/fipe/api/v1/carros/marcas/$codeMarca/modelos/$codeModelo/anos');
      if (response.statusCode == 200) {
        final data = response.data;
        if (data is List) {
          final ano =
              data.map((objetoJson) => AnoModel.fromMap(objetoJson)).toList();
          return Right(ano);
        } else {
          return Left(data.printError());
        }
      } else {
        return Left('Erro na solicitação: ${response.statusCode}');
      }
    } catch (e) {
      return Left('$e'.toString());
    }
  }

  Future<Either<String, ValorResponse>> buscarValor(
    String codeMarca,
    String codeModelo,
    String codeAno,
  ) async {
    try {
      final response = await dio.get(
          'https://parallelum.com.br/fipe/api/v1/carros/marcas/$codeMarca/modelos/$codeModelo/anos/$codeAno');

      if (response.statusCode == 200) {
        final model = ValorResponse.fromMap(response.data);

        return Right(model);
      } else {
        return Left('Erro na solicitação: ${response.statusCode}');
      }
    } catch (e) {
      return Left('$e'.toString());
    }
  }
}
