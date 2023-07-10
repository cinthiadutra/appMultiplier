import 'dart:convert';

class ValorResponse {
  final int tipoVeiculo;
  final String valor;
  final String marca;
  final String modelo;
  final int anoModelo;
  final String combustivel;
  final String codigoFipe;
  final String mesReferencia;
  final String siglaCombustivel;
  ValorResponse({
    required this.tipoVeiculo,
    required this.valor,
    required this.marca,
    required this.modelo,
    required this.anoModelo,
    required this.combustivel,
    required this.codigoFipe,
    required this.mesReferencia,
    required this.siglaCombustivel,
  });

  @override
  String toString() {
    return 'ValorResponse(TipoVeiculo: $tipoVeiculo, Valor: $valor, Marca: $marca, Modelo: $modelo, AnoModelo: $anoModelo, Combustivel: $combustivel, CodigoFipe: $codigoFipe, MesReferencia: $mesReferencia, SiglaCombustivel: $siglaCombustivel)';
  }

  Map<String, dynamic> toMap() {
    return {
      'TipoVeiculo': tipoVeiculo,
      'Valor': valor,
      'Marca': marca,
      'Modelo': modelo,
      'AnoModelo': anoModelo,
      'Combustivel': combustivel,
      'CodigoFipe': codigoFipe,
      'MesReferencia': mesReferencia,
      'SiglaCombustivel': siglaCombustivel,
    };
  }

  factory ValorResponse.fromMap(Map<String, dynamic> map) {
    return ValorResponse(
      tipoVeiculo: map['TipoVeiculo']?.toInt(),
      valor: map['Valor'],
      marca: map['Marca'],
      modelo: map['Modelo'],
      anoModelo: map['AnoModelo'],
      combustivel: map['Combustivel'],
      codigoFipe: map['CodigoFipe'],
      mesReferencia: map['MesReferencia'],
      siglaCombustivel: map['SiglaCombustivel'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ValorResponse.fromJson(String source) =>
      ValorResponse.fromMap(json.decode(source));
}
