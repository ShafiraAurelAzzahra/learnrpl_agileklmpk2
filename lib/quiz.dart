import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/home_screen.dart'; // Import your HomeScreen
import 'package:myapp/materi.dart'; // Import your MateriPage
import 'package:myapp/quiz%20pages/quiz1.dart';
import 'package:myapp/quiz%20pages/quiz2.dart';
import 'package:myapp/quiz%20pages/quiz3.dart';
import 'package:myapp/quiz%20pages/quiz4.dart';
import 'package:myapp/quiz%20pages/quiz5.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _selectedIndex = 2; // Start with the Quiz page

  final List<Quiz> quizList = [
    Quiz('Quiz 1', 'assets/images/img_premium_vector_114x152.png'),
    Quiz('Quiz 2', 'assets/images/img_premium_vector_114x152.png'),
    Quiz('Quiz 3', 'assets/images/img_premium_vector_114x152.png'),
    Quiz('Quiz 4', 'assets/images/img_premium_vector_114x152.png'),
    Quiz('Quiz 5', 'assets/images/img_premium_vector_114x152.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
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
          children: quizList.map((quiz) {
            return _buildQuizCard(context, quiz);
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

  Widget _buildQuizCard(BuildContext context, Quiz quiz) {
    return GestureDetector(
      onTap: () {
        // Navigasi berdasarkan quiz yang dipilih
        switch (quiz.judul) {
          case 'Quiz 1':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Quiz1Screen()),
            );
            break;
          case 'Quiz 2':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Quiz2Screen()),
            );
            break;
          case 'Quiz 3':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Quiz3Screen()),
            );
            break;
          case 'Quiz 4':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Quiz4Screen()),
            );
            break;
          case 'Quiz 5':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Quiz5Screen()),
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
                quiz.imagePath,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Text(
                quiz.judul,
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

class Quiz {
  final String judul;
  final String imagePath;

  Quiz(this.judul, this.imagePath);
}
