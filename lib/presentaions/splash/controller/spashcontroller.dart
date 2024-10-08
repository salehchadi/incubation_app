import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hospitalapp/core/routes.dart';


class SplashController extends GetxController {
  // Control Variables
  // Functions

  void splashTimer() {
    Timer(
      Duration(seconds: 20),
      () {
        Get.offNamed(
          StringsRoute.login,
        );
      },
    );
  }
}
