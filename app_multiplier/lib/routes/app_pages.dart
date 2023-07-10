// ignore_for_file: non_constant_identifier_names

import 'package:app_multiplier/multiplier_binding.dart';
import 'package:app_multiplier/routes/app_routes.dart';
import 'package:app_multiplier/views/cadastro_carro_page.dart';
import 'package:app_multiplier/views/home_page.dart';
import 'package:app_multiplier/views/lista_carros.dart';
import 'package:app_multiplier/views/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> AppPages = [
  GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: MultiplierBinding()),
  GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: MultiplierBinding()),
  GetPage(
      name: AppRoutes.cadastrados,
      page: () =>  ListaCarros(),
      binding: MultiplierBinding()),
];

class AppPage {
  static final routes = <GetPage<dynamic>>[
    ...AppPages,
  ];
}
