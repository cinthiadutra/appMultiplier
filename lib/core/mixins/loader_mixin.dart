// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(loading, (_) async {
      if (loading.isTrue) {
        await Get.dialog(
            PopScope(
              onPopInvoked: (bool) => false,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 6,
                ),
              ),
            ),
            barrierDismissible: false);
      } else {
        Get.back();
      }
    });
  }
}
