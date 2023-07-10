

import 'dart:convert';

class Modelo {
    final List<ModeloElement> modelos;
    final List<Ano> anos;

    Modelo({
        required this.modelos,
        required this.anos,
    });

    factory Modelo.fromJson(String str) => Modelo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Modelo.fromMap(Map<String, dynamic> json) => Modelo(
        modelos: List<ModeloElement>.from(json["modelos"].map((x) => ModeloElement.fromMap(x))),
        anos: List<Ano>.from(json["anos"].map((x) => Ano.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "modelos": List<dynamic>.from(modelos.map((x) => x.toMap())),
        "anos": List<dynamic>.from(anos.map((x) => x.toMap())),
    };
}

class Ano {
    final String codigo;
    final String nome;

    Ano({
        required this.codigo,
        required this.nome,
    });

    factory Ano.fromJson(String str) => Ano.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ano.fromMap(Map<String, dynamic> json) => Ano(
        codigo: json["codigo"],
        nome: json["nome"],
    );

    Map<String, dynamic> toMap() => {
        "codigo": codigo,
        "nome": nome,
    };
}

class ModeloElement {
    final int codigo;
    final String nome;

    ModeloElement({
        required this.codigo,
        required this.nome,
    });

    factory ModeloElement.fromJson(String str) => ModeloElement.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ModeloElement.fromMap(Map<String, dynamic> json) => ModeloElement(
        codigo: json["codigo"],
        nome: json["nome"],
    );

    Map<String, dynamic> toMap() => {
        "codigo": codigo,
        "nome": nome,
    };
}