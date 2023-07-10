import 'package:app_multiplier/views/lista_carros.dart';
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
                color: Colors.transparent,
                icon: const Icon(
                  Icons.menu_open_rounded,
                  color: Colors.blue,
                ),
                position: PopupMenuPosition.under,
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'Veiculos Cadastrados',
                      child: const Text(
                        'Veiculos Cadastrados',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Get.to((() => ListaCarros()));
                      },
                    ),
                    const PopupMenuItem<String>(
                      value: 'item2',
                      child: Text(
                        'Menu 2',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ];
                },
                onSelected: ((value) {}),
              ),
            ]);
}
