import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/views/widget/button_adicionar.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class HeaderLista extends GetView<MultiplierController> {
  const HeaderLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Olá, Cliente',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Veiculos Cadastrados"), ButtonAdicionar()]),
        Divider(
          thickness: 2,
        ),
      ]),
    );
  }
}
