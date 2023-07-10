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
}
