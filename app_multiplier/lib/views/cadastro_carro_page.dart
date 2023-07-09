import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/views/widget/appbar_mobcar.dart';
import 'package:app_multiplier/views/widget/page_carro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroCarroPage extends GetView<MultiplierController> {
  CadastroCarroPage({Key? key}) : super(key: key);
  @override
  final controller = Get.put<MultiplierController>(MultiplierController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarMobcar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(shrinkWrap: true, children: [
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
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text('Adicionar'),
                  onPressed: () {
                    controller.listaDeMarcas();
                    showDialog(
                      barrierLabel: 'Teste',
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Row(
                              children: [
                                Icon(Icons.car_repair),
                                Text(
                                  ' Cadastro de Veículos',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            content: PageCarro(),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('X'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ]);
                      },
                    );
                  }),
            ]),
            const Divider(
              thickness: 2,
            )
          ]),
        ));
  }
}
