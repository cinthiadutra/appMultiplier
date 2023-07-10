import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/model/carro_model.dart';
import 'package:app_multiplier/views/widget/drop_down_ano.dart';
import 'package:app_multiplier/views/widget/drop_down_marca.dart';
import 'package:app_multiplier/views/widget/drop_down_modelo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormPageCarro extends GetView<MultiplierController> {
  @override
  // final controller = Get.put<MultiplierController>(MultiplierController());

  final CarroModel item;
  FormPageCarro(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 380,
        width: MediaQuery.of(context).size.width,
        child: ListView(shrinkWrap: true, children: [
          Image.asset(
            'assets/images/mercedes.jpg',
            height: 120,
          ),
          FutureBuilder(
              future: controller.listarMarcas(),
              builder: (context, snap) {
                switch (snap.connectionState) {
                  case ConnectionState.none:
                    return Container();
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return ListView(shrinkWrap: true, children: [
                      const SizedBox(height: 20),
                      Obx(() {
                        return DropDownMarca(
                          items: controller.listaDeMarcas.value,
                          onChanged: (newValue) async {
                            controller.marcaSelecionada = newValue;
                            controller.marcaSelecionada.obs;
                            await controller.listarModelos();
                          },
                          focusNode: FocusNode(),
                          hintText: "Marcas",
                          margin: const EdgeInsets.only(top: 8),
                          alignment: Alignment.center,
                        );
                      }),
                      Obx(() => DropDownModelo(
                          focusNode: FocusNode(),
                          hintText: 'Modelos',
                          margin: const EdgeInsets.only(top: 8),
                          alignment: Alignment.center,
                          items: controller.listaDeModelos.value,
                          onChanged: (String newValue) async {
                            controller.modeloSelecionado = newValue;

                            controller.listaDeModelos.obs;

                            await controller.listarAnos();
                          })),
                      Obx(() => DropDownAno(
                          focusNode: FocusNode(),
                          hintText: 'Ano',
                          margin: const EdgeInsets.only(top: 8),
                          alignment: Alignment.center,
                          items: controller.listaDeAno.value,
                          onChanged: (String newValue) async {
                            controller.anoSelecionado = newValue;

                            controller.anoSelecionado.obs;

                            await controller.listarValor();
                            controller.valorCarro.obs;
                          })),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return controller.isLoading.value
                            ? const CircularProgressIndicator()
                            : Container(
                                width: 300,
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    width: 1,
                                  ),
                                ),
                                height: 35,
                                child: Text(
                                  controller.valorCarro.value.obs.value,
                                  textAlign: TextAlign.left,
                                ),
                              );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar',
                                style: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black)),
                              onPressed: () {
                                controller.addCarro(item);
                              },
                              child: const Text('Salvar',
                                  style: TextStyle(color: Colors.white)))
                        ],
                      )
                    ]);
                }
              }),
        ]));
  }
}
