import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/home_screen.dart'; // Import your HomeScreen
import 'package:myapp/quiz.dart'; // Import your QuizPage
import 'package:myapp/materi%20pages/materi1.dart';
import 'package:myapp/materi%20pages/materi2.dart';
import 'package:myapp/materi%20pages/materi3.dart';
import 'package:myapp/materi%20pages/materi4.dart';
import 'package:myapp/materi%20pages/materi5.dart';

class MateriPage extends StatefulWidget {
  @override
  _MateriPageState createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  int _selectedIndex = 1; // Start with the Materi page

  final List<Materi> materiList = [
    Materi('Materi 1', 'assets/images/img_premium_vector.png'),
    Materi('Materi 2', 'assets/images/img_premium_vector.png'),
    Materi('Materi 3', 'assets/images/img_premium_vector.png'),
    Materi('Materi 4', 'assets/images/img_premium_vector.png'),
    Materi('Materi 5', 'assets/images/img_premium_vector.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Material',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0XFF083791),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: materiList.map((materi) {
            return _buildMateriCard(context, materi);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0XFF083791),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex, // Manage selected index
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // Handle navigation based on the selected index
            switch (index) {
              case 0: // Home
                Get.to(() => HomeScreen());
                break;
              case 1: // Materi
                Get.to(() => MateriPage());
                break;
              case 2: // Quiz
                Get.to(() => QuizPage());
                break;
            }
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Materi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
        ],
      ),
    );
  }

  Widget _buildMateriCard(BuildContext context, Materi materi) {
    return GestureDetector(
      onTap: () {
        // Navigasi berdasarkan materi yang dipilih
        switch (materi.judul) {
          case 'Materi 1':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Materi1Screen()),
            );
            break;
          case 'Materi 2':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Materi2Screen()),
            );
            break;
          case 'Materi 3':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Materi3Screen()),
            );
            break;
          case 'Materi 4':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Materi4Screen()),
            );
            break;
          case 'Materi 5':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Materi5Screen()),
            );
            break;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFF083791),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset(
                materi.imagePath,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Text(
                materi.judul,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 100,
        ),
      ),
    );
  }
}

class Materi {
  final String judul;
  final String imagePath;

  Materi(this.judul, this.imagePath);
}
