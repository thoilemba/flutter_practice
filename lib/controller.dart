import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainController extends GetxController {

  RxInt count = 1.obs; // state variable

  // changing the state variable and updating
  void changeValue(int index) {
    count.value = index;
    update();

    if (kDebugMode) {
      print(count.value);
    }
  }
 }