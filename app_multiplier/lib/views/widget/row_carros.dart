import 'package:app_multiplier/model/carro_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/views/widget/detalhes_carro.dart';

class RowCarros extends GetView<MultiplierController> {
  final String modelo;
  final String ano;
  final String marca;
  final String valor;
  final CarroModel item;
  const RowCarros({
    super.key,
    required this.item,
    required this.modelo,
    required this.ano,
    required this.marca,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/mercedes.jpg'),
        Column(
          children: [
            Text(
              modelo.obs.value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              ano.obs.value,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
            TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            const Icon(Icons.car_repair),
                            Text(
                              modelo,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        content: DetalhesCarros(),
                      );
                    },
                  );
                },
                child: const Text(
                  'ver mais..,',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
        IconButton(
            onPressed: () {
              PopupMenuButton<String>(
                color: Colors.transparent,
                icon: const Icon(
                  Icons.menu_open_rounded,
                  color: Colors.blue,
                ),
                position: PopupMenuPosition.under,
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: '',
                      child: const Text(
                        'Excluir',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        controller.removeItem(item);
                      },
                    ),
                  ];
                },
                onSelected: ((value) {}),
              );
            },
            icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
