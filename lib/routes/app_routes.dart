import 'package:get/get.dart'; // Mengimpor package GetX untuk manajemen state dan navigasi
import '../tampilan_depan_controller.dart'; // Mengimpor controller untuk tampilan depan
import '../tampilan_depan_screen.dart'; // Mengimpor widget tampilan depan
import '../home_controller.dart'; // Mengimpor controller untuk home screen
import '../home_screen.dart'; // Mengimpor widget home screen
import '../materi.dart'; // Mengimpor widget materi
import '../quiz.dart'; // Mengimpor widget quiz

class AppRoutes { // Mendeklarasikan kelas AppRoutes
  static const String tampilanDepanScreen = '/tampilan_depan_screen'; // Mendefinisikan rute untuk tampilan depan

  static const String homeScreen = '/home_screen'; // Mendefinisikan rute untuk home screen

  static const String materiPage = '/materi_Page'; // Mendefinisikan rute untuk materi page

  static const String quizPage = '/quiz_Page'; // Mendefinisikan rute untuk quiz page

  static const String homeinitialPage = '/home_initial_page'; // Rute untuk halaman awal home

  static const String appNavigationScreen = '/app_navigation_screen'; // Rute untuk halaman navigasi aplikasi

  static const String initialRoute = '/initialRoute'; // Rute untuk jalur awal

  static List<GetPage> pages = [ // Mendeklarasikan list yang berisi rute-rute aplikasi
    GetPage( // Rute untuk tampilan depan
      name: tampilanDepanScreen, // Nama rute
      page: () => TampilanDepanScreen(), // Widget yang akan ditampilkan
      bindings: [TampilanDepanBinding()], // Binding untuk controller yang terkait
    ),
    GetPage( // Rute untuk home screen
      name: homeScreen, // Nama rute
      page: () => HomeScreen(), // Widget yang akan ditampilkan
      bindings: [HomeBinding()], // Binding untuk controller yang terkait
    ),
    GetPage( // Rute untuk materi page
      name: materiPage, // Nama rute
      page: () => MateriPage(), // Widget yang akan ditampilkan
    ),
    GetPage( // Rute untuk quiz page
      name: quizPage, // Nama rute
      page: () => QuizPage(), // Widget yang akan ditampilkan
    ),
    GetPage( // Rute untuk jalur awal
      name: initialRoute, // Nama rute
      page: () => TampilanDepanScreen(), // Widget yang akan ditampilkan
      bindings: [TampilanDepanBinding()], // Binding untuk controller yang terkait
    )
  ];
}
