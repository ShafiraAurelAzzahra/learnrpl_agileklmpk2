import 'package:flutter/material.dart'; // Mengimpor Material Design untuk membangun UI di Flutter.
import 'package:get/get.dart'; // Mengimpor GetX untuk manajemen state, routing, dan dependency injection.

class HomeModel {} // Membuat kelas model kosong sebagai template data yang akan digunakan oleh controller.

class HomeController extends GetxController {
  TextEditingController searchController =
      TextEditingController(); // Controller untuk mengatur input teks pada TextField.

  Rx<HomeModel> homeModelObj =
      HomeModel().obs; // Membuat objek HomeModel sebagai observasi (Rx).

  @override
  void onClose() {
    super.onClose();
    searchController
        .dispose(); // Menghapus controller untuk input teks ketika controller ini dihancurkan.
  }

  var currentIndex = 0
      .obs; // Mendeklarasikan variabel currentIndex yang menyimpan nilai indeks tab saat ini.

  void changeTabIndex(int index) {
    currentIndex.value =
        index; // Mengubah nilai currentIndex menjadi nilai index yang diberikan.
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        HomeController()); // Menggunakan Get.lazyPut untuk inisialisasi HomeController.
  }
}
