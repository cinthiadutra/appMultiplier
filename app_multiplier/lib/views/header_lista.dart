import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/model/carro_model.dart';
import 'package:app_multiplier/views/widget/button_adicionar.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class HeaderLista extends GetView<MultiplierController> {
  final CarroModel model;

  const HeaderLista(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Olá, Cliente',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text("Veiculos Cadastrados"),
        ButtonAdicionar(model)
      ]),
      const Divider(
        thickness: 2,
      ),
    ]);
  }
}
