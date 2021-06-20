import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void onSelected(int index) {
    currentIndex.value = index;
  }
}
