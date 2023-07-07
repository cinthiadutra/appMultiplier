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
    return 'ValorResponse(tipoVeiculo: $tipoVeiculo, valor: $valor, marca: $marca, modelo: $modelo, anoModelo: $anoModelo, combustivel: $combustivel, codigoFipe: $codigoFipe, mesReferencia: $mesReferencia, siglaCombustivel: $siglaCombustivel)';
  }

  Map<String, dynamic> toMap() {
    return {
      'tipoVeiculo': tipoVeiculo,
      'valor': valor,
      'marca': marca,
      'modelo': modelo,
      'anoModelo': anoModelo,
      'combustivel': combustivel,
      'codigoFipe': codigoFipe,
      'mesReferencia': mesReferencia,
      'siglaCombustivel': siglaCombustivel,
    };
  }

  factory ValorResponse.fromMap(Map<String, dynamic> map) {
    return ValorResponse(
      tipoVeiculo: map['tipoVeiculo']?.toInt() ?? 0,
      valor: map['valor'] ?? '',
      marca: map['marca'] ?? '',
      modelo: map['modelo'] ?? '',
      anoModelo: map['anoModelo']?.toInt() ?? 0,
      combustivel: map['combustivel'] ?? '',
      codigoFipe: map['codigoFipe'] ?? '',
      mesReferencia: map['mesReferencia'] ?? '',
      siglaCombustivel: map['siglaCombustivel'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ValorResponse.fromJson(String source) => ValorResponse.fromMap(json.decode(source));
}
