import 'package:flutter/material.dart'; // Mengimpor paket material design dari Flutter
import 'package:get/get.dart'; // Mengimpor paket GetX untuk manajemen state dan navigasi
import 'package:myapp/materi.dart'; // Mengimpor halaman MateriPage dari file materi.dart
import 'package:myapp/quiz.dart'; // Mengimpor halaman QuizPage dari file quiz.dart
import 'home_controller.dart'; // Mengimpor controller untuk HomeScreen

class HomeScreen extends GetWidget<HomeController> { // Mendefinisikan HomeScreen sebagai widget GetWidget yang terhubung dengan HomeController
  const HomeScreen({Key? key}) : super(key: key); // Konstruktor HomeScreen

  @override
  Widget build(BuildContext context) { // Fungsi untuk membangun UI dari HomeScreen
    return SafeArea( // Menghindari area layar yang tidak dapat diakses
      child: Scaffold( // Menggunakan scaffold untuk struktur dasar halaman
        resizeToAvoidBottomInset: false, // Menghindari tampilan terpotong saat keyboard muncul
        backgroundColor: Colors.white, // Mengatur latar belakang menjadi putih
        body: Column( // Menggunakan Column untuk menyusun widget secara vertikal
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // Memberikan padding di sekitar konten
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Menyusun anak-anak kolom ke kiri
                children: [
                  Row( // Menggunakan Row untuk menyusun widget secara horizontal
                    children: [
                      const Icon(Icons.person, size: 32, color: Color(0XFF083791)), // Ikon profil
                      const SizedBox(width: 8), // Ruang antara ikon dan teks
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks ke kiri
                        children: const [
                          Text(
                            'Hi Good People !',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0XFF083791)), // Teks salam
                          ),
                          Text('Welcome App LearnRPL', style: TextStyle(fontSize: 16, color: Color(0XFF083791))), // Teks sambutan
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Ruang vertikal
                  Card( // Membuat kartu untuk menampilkan informasi
                    color: const Color(0XFF083791), // Mengatur warna kartu
                    elevation: 5, // Mengatur elevasi kartu
                    child: Padding(
                      padding: const EdgeInsets.all(16.0), // Padding di dalam kartu
                      child: Row( // Menggunakan Row untuk menyusun isi kartu
                        children: [
                          Expanded( // Menggunakan Expanded agar kolom menggunakan ruang yang tersedia
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks ke kiri
                              children: const [
                                Text(
                                  'Hello',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), // Teks judul
                                ),
                                SizedBox(height: 10), // Ruang vertikal
                                Text(
                                  'Aplikasi ini adalah platform pembelajaran yang menyediakan materi lengkap untuk mempelajari Rekayasa Perangkat Lunak',
                                  style: TextStyle(color: Colors.white), // Teks deskripsi
                                ),
                              ],
                            ),
                          ),
                          Image.asset( // Menampilkan gambar dari aset
                            'assets/images/img_rpl1_2.png', // Ganti dengan path gambar yang sesuai
                            height: 50, // Mengatur tinggi gambar
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Ruang vertikal
                  // Search bar with blue color
                  TextField( // Membuat kotak pencarian
                    decoration: InputDecoration(
                      hintText: 'Search', // Teks petunjuk
                      hintStyle: const TextStyle(color: Color(0XFF083791)), // Warna teks petunjuk
                      prefixIcon: const Icon(Icons.search, color: Color(0XFF083791)), // Ikon pencarian
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8), // Mengatur radius border
                        borderSide: const BorderSide(color: Color(0XFF083791)), // Warna border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8), // Radius border saat fokus
                        borderSide: const BorderSide(color: Color(0XFF083791)), // Warna border saat fokus
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Ruang vertikal
            Expanded( // Menggunakan Expanded untuk mengisi ruang yang tersisa
              child: SingleChildScrollView( // Membuat scrollable widget
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // Padding di sekitar konten
                  child: Row( // Menggunakan Row untuk menyusun item secara horizontal
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Memberikan ruang antara item
                    children: [
                      Expanded( // Menggunakan Expanded agar item pertama menggunakan ruang yang tersedia
                        child: InkWell( // Membuat widget dapat ditekan
                          onTap: () {
                            // Arahkan ke halaman TampilanMenuMateriScreen
                            Get.to(() => MateriPage()); // Navigasi ke halaman MateriPage
                          },
                          child: buildSingleItem( // Memanggil fungsi untuk membangun item tunggal
                            'Materi',
                            'View Catalog Materi',
                            'assets/images/img_premium_vector.png', // Gambar item
                            const Color(0XFF083791), // Warna judul
                          ),
                        ),
                      ),
                      const SizedBox(width: 12), // Ruang horizontal antara item
                      Expanded( // Menggunakan Expanded agar item kedua menggunakan ruang yang tersedia
                        child: InkWell( // Membuat widget dapat ditekan
                          onTap: () {
                            // Arahkan ke halaman TampilanMenuMateriScreen
                            Get.to(() => QuizPage()); // Navigasi ke halaman QuizPage
                          },
                          child: buildSingleItem( // Memanggil fungsi untuk membangun item tunggal
                            'Quiz',
                            'View Catalog Quiz',
                            'assets/images/img_premium_vector_114x152.png', // Gambar item
                            const Color(0XFF083791), // Warna judul
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar( // Membuat bar navigasi di bagian bawah
          currentIndex: controller.currentIndex.value, // Menggunakan currentIndex dari controller
          onTap: (index) { // Fungsi untuk menangani tap pada item navigasi
            // Pindah halaman sesuai tab yang di-tap
            if (index == 0) {
              Get.to(() => const HomeScreen()); // Navigasi ke halaman HomeScreen
            } else if (index == 1) {
              Get.to(() => MateriPage()); // Navigasi ke halaman MateriPage
            } else if (index == 2) {
              Get.to(() => QuizPage()); // Navigasi ke halaman QuizPage
            }
            controller.changeTabIndex(index); // Ubah index pada controller
          },
          selectedItemColor: const Color(0XFF083791), // Warna item terpilih
          unselectedItemColor: const Color(0XFF083791), // Warna item yang tidak terpilih
          items: const [ // Daftar item pada BottomNavigationBar
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Ikon untuk item Home
              label: 'Home', // Label untuk item Home
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book), // Ikon untuk item Materi
              label: 'Materi', // Label untuk item Materi
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz), // Ikon untuk item Quiz
              label: 'Quiz', // Label untuk item Quiz
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun item tunggal dalam daftar
  Widget buildSingleItem(String title, String item, String imagePath, Color titleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks ke kiri
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: titleColor), // Gaya teks untuk judul
        ),
        const SizedBox(height: 10), // Ruang vertikal
        Card( // Membuat kartu untuk item
          elevation: 3, // Mengatur elevasi kartu
          child: SizedBox(
            height: 150, // Mengatur tinggi kartu
            child: Column(
              children: [
                Expanded(
                  child: Image.asset( // Menampilkan gambar dari aset
                    imagePath, // Path gambar dari parameter
                    width: double.infinity, // Mengatur lebar gambar agar memenuhi kartu
                    fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran kartu
                  ),
                ),
                InkWell( // Membuat widget dapat ditekan
                  onTap: () { // Fungsi saat item ditekan
                    // Arahkan ke halaman TampilanMenuMateriScreen saat item ditekan
                    if (item == 'View Catalog Materi') {
                      Get.to(() => MateriPage()); // Navigasi ke halaman MateriPage
                    }
                    if (item == 'View Catalog Quiz') {
                      Get.to(() => QuizPage()); // Navigasi ke halaman QuizPage
                    }
                  },
                  child: Container(
                    color: Color(0XFF083791), // Warna latar belakang untuk tombol
                    width: double.infinity, // Mengatur lebar tombol agar memenuhi kartu
                    padding: const EdgeInsets.all(8.0), // Padding di dalam tombol
                    child: Text(
                      item, // Teks tombol
                      textAlign: TextAlign.center, // Mengatur teks agar berada di tengah
                      style: const TextStyle(
                        color: Colors.white, // Warna teks
                        fontSize: 14, // Ukuran font
                        fontWeight: FontWeight.bold, // Gaya font
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
