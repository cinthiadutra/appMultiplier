import 'dart:convert';


class AnoModel {
  final String codigo;
  final String name;
  AnoModel({
    required this.codigo,
    required this.name,
  });

  @override
  String toString() => 'AnoModel(codigo: $codigo, name: $name)';

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'name': name,
    };
  }

  factory AnoModel.fromMap(Map<String, dynamic> map) {
    return AnoModel(
      codigo: map['codigo'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AnoModel.fromJson(String source) => AnoModel.fromMap(json.decode(source));
}
