// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CarroModel {
  String marca;
  String modelo;
  String ano;
  String valor;
  CarroModel({
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.valor,
  });

  @override
  String toString() {
    return 'CarroModel(marca: $marca, modelo: $modelo, ano: $ano, valor: $valor)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'marca': marca,
      'modelo': modelo,
      'ano': ano,
      'valor': valor,
    };
  }

  factory CarroModel.fromMap(Map<String, dynamic> map) {
    return CarroModel(
      marca: map['marca'] as String,
      modelo: map['modelo'] as String,
      ano: map['ano'] as String,
      valor: map['valor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarroModel.fromJson(String source) => CarroModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
