import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/model/carro_model.dart';
import 'package:app_multiplier/views/form_page_carro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonAdicionar extends GetView<MultiplierController> {
  final CarroModel item;
  const ButtonAdicionar(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
        ),
        child: const Text('Adicionar'),
        onPressed: () {
          controller.listaDeMarcas();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actionsAlignment: MainAxisAlignment.end,
                actions: [
                  TextButton(
                    child: const Text('X'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
                titlePadding: const EdgeInsets.only(top: 10, left: 8),
                title: const Row(
                  children: [
                    Icon(Icons.car_repair),
                    Text(
                      ' Cadastro de Veículos',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                content: FormPageCarro(item),
              );
            },
          );
        });
  }
}
