import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/views/widget/drop_down_ano.dart';
import 'package:app_multiplier/views/widget/drop_down_marca.dart';
import 'package:app_multiplier/views/widget/drop_down_modelo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageCarro extends GetView<MultiplierController> {
  @override
  final controller = Get.put<MultiplierController>(MultiplierController());
  final formKey = GlobalKey<FormState>();
  PageCarro({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 600,
        child: ListView(shrinkWrap: true, children: [
          Image.asset(
            'assets/images/mercedes.jpg',
            height: 150,
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
                      const SizedBox(height: 32),
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
                          })),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder()),
                          focusNode: FocusNode(),
                          controller: controller.valor,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Preencha o campo';
                            }
                            return null;
                          },
                        ),
                      ),
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
                              onPressed: () {},
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
