import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/views/header_lista.dart';
import 'package:app_multiplier/views/lista_carros.dart';
import 'package:app_multiplier/views/widget/appbar_mobcar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroCarroPage extends StatefulWidget {
  const CadastroCarroPage({Key? key}) : super(key: key);

  @override
  State<CadastroCarroPage> createState() => _CadastroCarroPageState();
}

final controller = Get.put<MultiplierController>(MultiplierController());

class _CadastroCarroPageState extends State<CadastroCarroPage> {
  final controller = Get.put<MultiplierController>(MultiplierController());
  @override
  void initState() {
    super.initState();

    controller.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarMobcar(),
        body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const HeaderLista(),
                  ListaCarros(),
                ])));
  }
}
