import 'package:app_multiplier/model/carro_model.dart';
import 'package:app_multiplier/views/cadastro_carro_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/views/detalhes_carro.dart';

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
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Image.asset(
            'assets/images/mercedes.jpg',
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  modelo.obs.value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  ano.obs.value,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
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
                                  controller.valoresCarros.value.modelo,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            content: DetalhesCarros(),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'ver mais..',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () {
                  showPopMenu(context);
                },
                icon: const Icon(Icons.more_vert)),
          )
        ],
      ),
    );
  }

  void showPopMenu(BuildContext context) {
    PopupMenuButton<String>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<String>(
            value: 'Excluir',
            child: const Text('Excluir'),
            onTap: () {
              controller.removeItem(item);
            },
          ),
        ];
      },
      onSelected: (selectedItem) {
        // Faça algo com o item selecionado, se necessário
      },
    );
  }
}
