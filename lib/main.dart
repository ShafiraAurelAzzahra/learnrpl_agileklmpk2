import 'package:flutter/material.dart'; // Mengimpor Material Design untuk UI Flutter.
import 'package:flutter/services.dart'; // Mengimpor package untuk mengatur sistem seperti orientasi layar.
import 'package:get/get.dart'; // Mengimpor GetX untuk state management, routing, dan dependency injection.
import 'routes/app_routes.dart'; // Mengimpor file routing aplikasi.
import 'home_controller.dart'; // Mengimpor HomeController untuk manajemen logika aplikasi.

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  // Memastikan binding widget sudah diinisialisasi sebelum menjalankan fungsi yang berinteraksi dengan Flutter engine.

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) {
    // Mengunci orientasi perangkat ke portrait (vertikal) saja.

    Get.put(HomeController()); 
    // Menginisialisasi HomeController menggunakan GetX untuk dependency injection, sehingga dapat diakses di seluruh aplikasi.

    runApp(MyApp()); 
    // Menjalankan aplikasi Flutter dengan widget root MyApp.
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, 
      // Menyembunyikan banner "debug" di pojok kanan atas aplikasi.

      locale: Get.deviceLocale, 
      // Mengambil locale perangkat pengguna untuk menyesuaikan bahasa aplikasi.

      fallbackLocale: Locale('en', 'US'), 
      // Menggunakan fallback locale (English, US) jika locale perangkat tidak didukung.

      title: 'myapp', 
      // Judul aplikasi yang bisa ditampilkan di task switcher atau bagian atas aplikasi.

      initialRoute: AppRoutes.initialRoute, 
      // Menentukan route awal aplikasi berdasarkan konfigurasi route di AppRoutes.

      getPages: AppRoutes.pages, 
      // Mendefinisikan seluruh halaman aplikasi menggunakan route yang dikelola oleh GetX.
    );
  }
}
