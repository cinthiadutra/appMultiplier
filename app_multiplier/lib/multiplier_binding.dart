import 'package:app_multiplier/service/multiplier_service.dart';
import 'package:get/get.dart';

// ignore: deprecated_member_use
class MultiplierBinding implements Bindings {
  @override
  void dependencies() {
     Get.put(MultiplierService());
    Get.put<MultiplierService>(MultiplierService());
  }
}