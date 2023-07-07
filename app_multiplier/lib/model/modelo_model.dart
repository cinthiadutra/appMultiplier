import 'dart:convert';

class ModeloModel {
  final String codigo;
  final String name;
  ModeloModel({
    required this.codigo,
    required this.name,
  });

  @override
  String toString() => 'ModeloModel(codigo: $codigo, name: $name)';

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'name': name,
    };
  }

  factory ModeloModel.fromMap(Map<String, dynamic> map) {
    return ModeloModel(
      codigo: map['codigo'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModeloModel.fromJson(String source) => ModeloModel.fromMap(json.decode(source));
}
