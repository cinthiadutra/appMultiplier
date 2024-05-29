import 'package:app_multiplier/views/cadastro_carro_page.dart';
import 'package:app_multiplier/views/contato.dart';
import 'package:app_multiplier/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarMobcar extends AppBar {
  AppbarMobcar({
    super.key,
    Color backgroundColor = Colors.black,
    List<Widget> actions = const [],
  }) : super(
            title: Image.asset(
              'assets/images/iconMob.png',
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
                      value: '',
                      child: const Text(
                        'Home',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Get.to((() => const HomePage()));
                      },
                    ),
                    PopupMenuItem<String>(
                      value: 'Cadastrados',
                      child: const Text(
                        'Cadastrados',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Get.to((() => const CadastroCarroPage()));
                      },
                    ),
                     PopupMenuItem<String>(
                      value: 'item2',
                      child: const Text(
                        'Contato',
                        style: TextStyle(color: Colors.white),
                      ),
                       onTap: () {
                        Get.to((() => const Contato()));
                      },
                    ),
                  ];
                },
                onSelected: ((value) {}),
              ),
            ]);
}
