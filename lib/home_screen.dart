import 'package:flutter/material.dart'; // Mengimpor paket material design dari Flutter
import 'package:get/get.dart'; // Mengimpor paket GetX untuk manajemen state dan navigasi
import 'package:myapp/materi.dart'; // Mengimpor halaman MateriPage dari file materi.dart
import 'package:myapp/quiz.dart'; // Mengimpor halaman QuizPage dari file quiz.dart
import 'home_controller.dart'; // Mengimpor controller untuk HomeScreen

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key); // Konstruktor HomeScreen

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person,
                          size: 32, color: Color(0XFF083791)),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hi Good People !',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF083791)),
                          ),
                          Text('Welcome App LearnRPL',
                              style: TextStyle(
                                  fontSize: 16, color: Color(0XFF083791))),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: const Color(0XFF083791),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Hello',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 10),
                                Text(
                                  'Aplikasi ini adalah platform pembelajaran yang menyediakan materi lengkap untuk mempelajari Rekayasa Perangkat Lunak',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Image.asset('assets/images/img_rpl1_2.png',
                              height: 50),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Color(0XFF083791)),
                      prefixIcon:
                          const Icon(Icons.search, color: Color(0XFF083791)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0XFF083791)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0XFF083791)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => MateriPage());
                          },
                          child: buildSingleItem(
                            'Materi',
                            'View Catalog Materi',
                            'assets/images/img_premium_vector.png',
                            const Color(0XFF083791),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => QuizPage());
                          },
                          child: buildSingleItem(
                            'Quiz',
                            'View Catalog Quiz',
                            'assets/images/img_premium_vector_114x152.png',
                            const Color(0XFF083791),
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            if (index == 0) {
              Get.to(() => const HomeScreen());
            } else if (index == 1) {
              Get.to(() => MateriPage());
            } else if (index == 2) {
              Get.to(() => QuizPage());
            }
            controller.changeTabIndex(index);
          },
          selectedItemColor: const Color(0XFF083791),
          unselectedItemColor: const Color(0XFF083791),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Materi'),
            BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          ],
        ),
      ),
    );
  }

  Widget buildSingleItem(
      String title, String item, String imagePath, Color titleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: titleColor),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 3,
          child: SizedBox(
            height: 150,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (item == 'View Catalog Materi') {
                      Get.to(() => MateriPage());
                    } else if (item == 'View Catalog Quiz') {
                      Get.to(() => QuizPage());
                    }
                  },
                  child: Container(
                    color: Color(0XFF083791),
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
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
