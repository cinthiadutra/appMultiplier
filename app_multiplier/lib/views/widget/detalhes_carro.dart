import 'package:app_multiplier/controller/multiplier_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetalhesCarros extends GetView<MultiplierController> {
  @override
  final controller = Get.put<MultiplierController>(MultiplierController());
  final formKey = GlobalKey<FormState>();
  DetalhesCarros({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600,
        child: ListView(shrinkWrap: true, children: [
          Image.asset(
            'assets/images/mercedes.jpg',
            height: 150,
            fit: BoxFit.fitWidth,
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'Marca',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(controller.marcaSelecionada)
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Ano',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(controller.anoSelecionado)
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    'Modelo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(controller.modeloSelecionado)
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Valor',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(controller.modeloSelecionado)
                ],
              )
            ],
          )
        ]));
  }
}
