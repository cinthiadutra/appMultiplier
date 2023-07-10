import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/views/header_lista.dart';
import 'package:app_multiplier/views/widget/appbar_mobcar.dart';
import 'package:app_multiplier/views/widget/row_carros.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaCarros extends GetView<MultiplierController> {
  ListaCarros({Key? key}) : super(key: key);
  @override
  final controller = Get.put<MultiplierController>(MultiplierController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarMobcar(),
        body: Obx(() {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.carrosCadastrados.length,
              itemBuilder: (context, index) {
                final item = controller.carrosCadastrados[index];
                return Column(
                  children: [
                    HeaderLista(item),
                    RowCarros(
                      ano: item.ano,
                      marca: item.marca,
                      modelo: item.modelo,
                      valor: item.valor,
                      item: item,
                    ),
                  ],
                );
              });
        }));
  }
}
