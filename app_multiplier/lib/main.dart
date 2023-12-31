import 'package:app_multiplier/core/ui/multiplier_ui.dart';
import 'package:app_multiplier/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
    await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [GetPage(name: '/home', page: () => const HomePage())],
      title: 'Mobcar',
      theme: MultiplierUi.theme,
      home: const HomePage(),
      initialRoute: 'home',
    );
  }
}
