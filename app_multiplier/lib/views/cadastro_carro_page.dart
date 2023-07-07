import 'package:app_multiplier/controller/multiplier_controller.dart';
import 'package:app_multiplier/views/widget/appbar_mobcar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroCarroPage extends GetView<MultiplierController> {
   
   const CadastroCarroPage({Key? key}) : super(key: key);
   
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppbarMobcar(),
           body: Container(),
       );
  }
}