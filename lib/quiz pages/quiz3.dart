import 'package:flutter/material.dart';
import 'package:myapp/quiz.dart';

class Quiz3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Analisis dan Perancangan Perangkat Lunak',
      theme: ThemeData(
        primaryColor: Color(0XFF083791), // Ubah warna utama menjadi Color(0XFF083791)
      ),
      home: QuizScreen(),
    );
  }
}

// Model pertanyaan dan jawaban
class Question {
  final String question;
  final List<String> options;
  final int correct;

  Question({
    required this.question,
    required this.options,
    required this.correct,
  });
}

// List pertanyaan (question) yang digunakan dalam quiz
final List<Question> questions = [
  Question(
    question: "Apa yang dimaksud dengan analisis kebutuhan dalam pengembangan perangkat lunak?",
    options: [
      "Proses pembuatan kode program",
      "Identifikasi kebutuhan pengguna dan spesifikasi sistem",
      "Proses pengujian perangkat lunak",
      "Pembuatan dokumentasi pengguna"
    ],
    correct: 2, // Jawaban yang benar (indeks jawaban)
  ),
  Question(
    question: "Mengapa tahap analisis kebutuhan sangat penting?",
    options: [
      "Untuk memastikan perangkat lunak sesuai dengan harapan pengguna",
      "Untuk mengurangi biaya pengembangan",
      "Untuk mempercepat proses pengujian",
      "Untuk meningkatkan efisiensi sistem"
    ],
    correct: 1,
  ),
  Question(
    question: "Diagram mana yang digunakan untuk menggambarkan interaksi antara aktor dan sistem?",
    options: [
      "Sequence Diagram",
      "Use Case Diagram",
      "ERD",
      "Class Diagram"
    ],
    correct: 2,
  ),
  Question(
    question: "Apa yang dimaksud dengan perancangan sistem?",
    options: [
      "Proses pembuatan program komputer",
      "Pembuatan desain arsitektur perangkat lunak",
      "Proses pengujian perangkat lunak",
      "Proses distribusi perangkat lunak"
    ],
    correct: 2,
  ),
  Question(
    question: "Apa tujuan dari penggunaan diagram UML dalam perancangan sistem?",
    options: [
      "Untuk meningkatkan performa perangkat lunak",
      "Untuk menggambarkan komponen sistem secara visual",
      "Untuk mempermudah pengujian perangkat lunak",
      "Untuk mengurangi biaya pengembangan"
    ],
    correct: 2,
  ),
  Question(
    question: "Apa itu prototyping dalam pengembangan perangkat lunak?",
    options: [
      "Teknik pengujian perangkat lunak",
      "Proses pembuatan versi awal perangkat lunak",
      "Pembuatan dokumentasi pengguna",
      "Proses penyebaran perangkat lunak"
    ],
    correct: 2,
  ),
  Question(
    question: "Salah satu keuntungan dari prototyping adalah:",
    options: [
      "Mengurangi waktu pengembangan secara signifikan",
      "Memberikan gambaran kasar kepada pengguna tentang bagaimana sistem akan berfungsi",
      "Mengurangi biaya perangkat lunak",
      "Meningkatkan kualitas kode program"
    ],
    correct: 2,
  ),
  Question(
    question: "Diagram mana yang menggambarkan urutan interaksi antar objek dalam sistem?",
    options: [
      "Use Case Diagram",
      "Sequence Diagram",
      "ERD",
      "Class Diagram"
    ],
    correct: 2,
  ),
  Question(
    question: "Apa yang menjadi fokus utama dalam analisis kebutuhan?",
    options: [
      "Biaya pengembangan perangkat lunak",
      "Kualitas kode yang ditulis",
      "Kebutuhan pengguna dan harapan mereka",
      "Teknologi yang digunakan dalam pengembangan"
    ],
    correct: 3,
  ),
  Question(
    question: "Apa itu ERD dalam konteks perancangan sistem?",
    options: [
      "Diagram yang menggambarkan alur proses",
      "Diagram yang menggambarkan hubungan antar entitas dalam basis data",
      "Diagram yang menggambarkan interaksi pengguna dengan sistem",
      "Diagram yang menunjukkan struktur organisasi pengembangan perangkat lunak"
    ],
    correct: 2,
  ),
];

// Layar Quiz
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;
  List<int?> selectedAnswers = List.filled(questions.length, null);

  void loadNextQuestion(int selected) {
    setState(() {
      selectedAnswers[currentQuestion] = selected;
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      } else {
        calculateScore();
      }
    });
  }

  void calculateScore() {
    score = selectedAnswers.asMap().entries.fold(0, (total, entry) {
      int index = entry.key;
      int? answer = entry.value;
      return total + (answer == questions[index].correct ? 10 : 0);
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0XFF083791), // Ubah latar belakang dialog
        content: Column(
          mainAxisSize: MainAxisSize.min, // Agar dialog sesuai ukuran konten
          children: [
            Center(
              child: Text(
                'Score',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Ubah warna judul menjadi putih
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                ' $score',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white, // Ubah warna teks nilai menjadi putih
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizPage()), // Ganti HalamanCatalogQuiz dengan nama halaman yang diinginkan
    );
  },
  child: Text(
    'Ke Halaman Catalog Quiz',
    style: TextStyle(color: Colors.white), // Warna teks tombol tetap putih
  ),
),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Analisis dan Perancangan Perangkat Lunak', style: TextStyle(color: Colors.white)), // Ubah warna teks menjadi putih
        backgroundColor: Color(0XFF083791), // Ubah warna AppBar menjadi Color(0XFF083791)
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pertanyaan ${currentQuestion + 1}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFF083791)), // Ubah warna teks menjadi biru dan bold
            ),
            SizedBox(height: 20),
            Text(
              questions[currentQuestion].question,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0XFF083791)), // Ubah warna teks menjadi biru dan bold
            ),
            SizedBox(height: 20),
            ...questions[currentQuestion].options.asMap().entries.map((entry) {
              int index = entry.key;
              String option = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnswers[currentQuestion] == index
                        ? Colors.white // Ubah warna tombol terpilih menjadi putih
                        : Color(0XFF083791), // Ubah warna tombol tidak terpilih menjadi Color(0XFF083791)
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    loadNextQuestion(index);
                  },
                  child: Text(
                    option,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Ubah warna pilihan jawaban menjadi putih dan bold
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
