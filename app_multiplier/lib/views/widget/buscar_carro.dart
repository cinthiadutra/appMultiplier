// import 'package:app_multiplier/controller/multiplier_controller.dart';
// import 'package:app_multiplier/views/widget/drop_down_modelo.dart';
// import 'package:app_multiplier/views/widget/drop_down_marca.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class BuscarCarro extends StatelessWidget {
 

//   BuscarCarro({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return showDialog<void>(
//         context: Get.context!,
//         barrierDismissible: false, // user must tap button!
//         builder: (BuildContext context) {
//           return AlertDialog(
//               title: const Text('Cadastro de Veículos'),
//               content: ListView(children: <Widget>[
//                 Image.asset('assets/images/carros.jpg'),
//                 FutureBuilder(
//                     future: controller.listarMarcas(),
//                     builder: (context, snap) {
//                       switch (snap.connectionState) {
//                         case ConnectionState.none:
//                           return Container();
//                         case ConnectionState.waiting:
//                           return const Center(
//                               child: CircularProgressIndicator());
//                         case ConnectionState.active:
//                         case ConnectionState.done:
//                           return Container(
//                               width: 400,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 24,
//                               ),
//                               child: ListView(children: [
//                                 Form(
//                                   key: formKey,
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.stretch,
//                                     children: [
//                                       const SizedBox(height: 32),
//                                       Obx(() {
//                                         return DropDownMarca(
//                                           items: controller.listaDeMarcas.value,
//                                           onChanged: (newValue) async {
//                                             controller.marcaSelecionada =
//                                                 newValue;
//                                             controller.listaDeModelos();
//                                           },
//                                           width: 342,
//                                           focusNode: FocusNode(),
//                                           hintText: "Série escolar*",
//                                           margin: const EdgeInsets.all(5),
//                                           alignment: Alignment.center,
//                                         );
//                                       }),
//                                       Obx(() => DropDownModelo(
//                                           width: 360,
//                                           focusNode: FocusNode(),
//                                           hintText: 'País*',
//                                           margin: const EdgeInsets.only(top: 8),
//                                           alignment: Alignment.center,
//                                           items:
//                                               controller.listaDeModelos.value,
//                                           onChanged: (String newValue) async {
//                                             controller.modeloSelecionado =
//                                                 newValue;

//                                             controller.listaDeModelos.obs;

//                                             await controller.listarValor();
//                                           })),
//                                       Obx(() => DropDownModelo(
//                                           width: 360,
//                                           focusNode: FocusNode(),
//                                           hintText: 'País*',
//                                           margin: const EdgeInsets.only(top: 8),
//                                           alignment: Alignment.center,
//                                           items:
//                                               controller.listaDeModelos.value,
//                                           onChanged: (String newValue) async {
//                                             controller.modeloSelecionado =
//                                                 newValue;

//                                             controller.listaDeModelos.obs;

//                                             await controller.listarValor();
//                                           })),
//                                       TextFormField(
//                                         focusNode: FocusNode(),
//                                         controller: controller.valor,
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return 'Preencha o campo';
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       Row(
//                                         children: [
//                                           TextButton(
//                                             onPressed: () {},
//                                             child: const Text('Cancelar',
//                                                 style: TextStyle()),
//                                           ),
//                                           TextButton(
//                                               onPressed: () {},
//                                               child: const Text('Salvar',
//                                                   style: TextStyle(
//                                                       color: Colors.white)))
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ]));
//                       }
//                     })
//               ]));
//         });
//   }
// }
