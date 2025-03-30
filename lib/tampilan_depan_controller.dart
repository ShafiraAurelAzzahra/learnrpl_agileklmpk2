import 'package:get/get.dart'; 
// Mengimpor GetX untuk manajemen state, routing, dan dependency injection.

class TampilanDepanModel {} 
// Kelas model kosong untuk halaman tampilan depan. Dapat digunakan untuk menyimpan data yang relevan.

class TampilanDepanController extends GetxController { 
  // Controller untuk mengatur logika dan data yang terhubung dengan tampilan depan.

  Rx<TampilanDepanModel> tampilanDepanModelObj = TampilanDepanModel().obs; 
  // Membuat objek dari `TampilanDepanModel` sebagai observasi (Rx) untuk memungkinkan reaktifitas data.
}

class TampilanDepanBinding extends Bindings { 
  // Kelas untuk mendeklarasikan dependensi yang diperlukan untuk `TampilanDepanController`.
  
  @override
  void dependencies() {
    Get.lazyPut(() => TampilanDepanController()); 
    // Menggunakan `Get.lazyPut` untuk inisialisasi `TampilanDepanController` hanya ketika diperlukan.
    // Ini membantu menghemat memori dengan tidak membuat instance controller sebelum diperlukan.
  }
}
