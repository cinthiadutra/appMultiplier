import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/views/form_page_carro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonAdicionar extends GetView<MultiplierController> {
  const ButtonAdicionar({Key? key}) : super(key: key);

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
                titlePadding: const EdgeInsets.only(top: 10, left: 8),
                title: Row(
                  children: [
                    const Icon(Icons.car_repair),
                    const Text(
                      ' Cadastro de Veículos',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      child: const Text(
                        'X',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
                content: const FormPageCarro(),
              );
            },
          );
        });
  }
}
