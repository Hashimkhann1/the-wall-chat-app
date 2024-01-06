

import 'package:get/get.dart';

class LoadingServices extends GetxController{

  RxBool isLoading = false.obs;

  setLoaidng() {
    isLoading.value = !isLoading.value;
  }

}