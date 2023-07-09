import 'package:app_multiplier/views/cadastro_carro_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarMobcar extends AppBar {
  AppbarMobcar({
    super.key,
    Color backgroundColor = Colors.black,
    List<Widget> actions = const [],
  }) : super(
            title: Image.asset(
              'assets/images/iconMob.jpeg',
              scale: 2.0,
            ),
            backgroundColor: backgroundColor,
            iconTheme: const IconThemeData(
              color: Colors.blue,
            ),
            actions: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.menu_open_rounded),
                position: PopupMenuPosition.under,
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'Veiculos Cadastrados',
                      child: const Text('Veiculos Cadastrados'),
                      onTap: () {
                        Get.to((() => CadastroCarroPage()));
                      },
                    ),
                    const PopupMenuItem<String>(
                      value: 'item2',
                      child: Text('Menu 2'),
                    ),
                  ];
                },
                onSelected: ((value) {}),
              ),
            ]);
}
