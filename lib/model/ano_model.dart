import 'dart:convert';


class AnoModel {
  final String codigo;
  final String nome;
  AnoModel({
    required this.codigo,
    required this.nome,
  });

  @override
  String toString() => 'AnoModel(codigo: $codigo, nome: $nome)';

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'nome': nome,
    };
  }

  factory AnoModel.fromMap(Map<String, dynamic> map) {
    return AnoModel(
      codigo: map['codigo'] ?? '',
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AnoModel.fromJson(String source) => AnoModel.fromMap(json.decode(source));
}
