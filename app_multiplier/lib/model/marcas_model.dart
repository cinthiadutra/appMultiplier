import 'dart:convert';

class MarcasModel {
  final String codigo;
  final String nome;
  MarcasModel({
    required this.codigo,
    required this.nome,
  });

  @override
  String toString() => 'MarcasModel(codigo: $codigo, Acura: $nome)';

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'Acura': nome,
    };
  }

  factory MarcasModel.fromMap(Map<String, dynamic> map) {
    return MarcasModel(
      codigo: map['codigo'] ?? '',
      nome: map['Acura'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MarcasModel.fromJson(String source) => MarcasModel.fromMap(json.decode(source));
}
