
import 'dart:convert';

class Modelo {

  final String codigo;
  final String name;
  Modelo({
    required this.codigo,
    required this.name,
  });

  @override
  String toString() => 'Modelo(codigo: $codigo, name: $name)';

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'name': name,
    };
  }

  factory Modelo.fromMap(Map<String, dynamic> map) {
    return Modelo(
      codigo: map['codigo'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Modelo.fromJson(String source) => Modelo.fromMap(json.decode(source));
}
