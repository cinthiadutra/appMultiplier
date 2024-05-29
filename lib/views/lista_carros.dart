import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/views/detalhes_carro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaCarros extends StatefulWidget {
  const ListaCarros({Key? key}) : super(key: key);

  @override
  State<ListaCarros> createState() => _ListaCarrosState();
}

class _ListaCarrosState extends State<ListaCarros> {
  void showPopMenu(BuildContext context) {}

  final controller = Get.put<MultiplierController>(MultiplierController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.carrosCadastrados.length,
          itemBuilder: (context, index) {
            final item = controller.carrosCadastrados[index];
            return Column(
              children: [
                ListTile(
                  trailing: PopupMenuButton<String>(
                    color: Colors.white,
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.blue,
                    ),
                    position: PopupMenuPosition.under,
                    initialValue: 'Excluir',
                    // Callback that sets the selected popup menu item.
                    onSelected: (item) {},
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Excluir',
                        child: const Text('Excluir'),
                        onTap: () => controller.removeItem(item),
                      ),
                      PopupMenuItem<String>(
                        value: 'voltar',
                        child: const Text('Sair'),
                        onTap: () => Navigator.pop(Get.context!),
                      ),
                    ],
                  ),
                  leading: Image.asset(
                    'assets/images/mercedes.jpg',
                    height: 60,
                  ),
                  title: Column(children: [
                    Text(
                      item.modelo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      item.ano,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ]),
                  subtitle: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.blue,
                              title: Wrap(
                                children: [
                                  const Icon(Icons.car_repair),
                                  Text(
                                    controller.valoresCarros.value.modelo.substring(0, 10),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
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
                      )),
                ),
                // RowCarros(
                //   ano: item.ano,
                //   marca: item.marca,
                //   modelo: item.modelo,
                //   valor: item.valor,
                //   item: item,
                // ),
                const Divider(
                  thickness: 2,
                )
              ],
            );
          });
    });
  }
}
