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
        height: 300,
        width: 600,
        child: ListView(shrinkWrap: true, children: [
          Image.asset(
            'assets/images/mercedes.jpg',
            height: 150,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Marca',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Text(controller.valoresCarros.value.marca,
                      style: const TextStyle(fontSize: 12))
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ano',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Text(controller.valoresCarros.value.anoModelo.toString(),
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 12))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Modelo',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(controller.valoresCarros.value.modelo,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 12))
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Valor',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(controller.valoresCarros.value.valor,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 12))
                  ],
                ),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                controller.mobcarDialog();
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    // Change your radius here
                    borderRadius: BorderRadius.circular(6),
                  )),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.black)),
              child: const Text(
                'Reservar',
                style: TextStyle(fontSize: 12),
              ))
        ]));
  }
}
