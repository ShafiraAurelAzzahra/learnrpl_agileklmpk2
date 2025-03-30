import 'package:flutter/material.dart';
import 'package:myapp/quiz.dart';

class Quiz5Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Pemeliharaan dan Evolusi Perangkat Lunak',
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
    question: "Apa yang dimaksud dengan Corrective Maintenance?",
    options: [
      "Penambahan fitur baru",
      "Perbaikan bug setelah perangkat lunak dirilis",
      "Modifikasi untuk beradaptasi dengan lingkungan baru",
      "Penghapusan fitur yang tidak digunakan"
    ],
    correct: 2, // Jawaban yang benar (indeks jawaban)
  ),
  Question(
    question: "Mengapa Adaptive Maintenance penting?",
    options: [
      "Untuk meningkatkan performa perangkat lunak",
      "Untuk menambah fitur baru",
      "Untuk memastikan perangkat lunak tetap relevan dengan perubahan lingkungan teknis",
      "Untuk menghapus bug yang ditemukan"
    ],
    correct: 3,
  ),
  Question(
    question: "Apa tujuan dari Perfective Maintenance?",
    options: [
      "Memperbaiki kesalahan yang terjadi",
      "Menambah fitur baru dan meningkatkan performa",
      "Mengadaptasi perangkat lunak dengan sistem yang lebih baru",
      "Mengurangi biaya operasional"
    ],
    correct: 2,
  ),
  Question(
    question: "Apa yang menjadi fokus utama dari Corrective Maintenance?",
    options: [
      "Modifikasi sistem untuk memenuhi kebutuhan pengguna",
      "Mengatasi kesalahan atau bug yang ada",
      "Menyediakan dokumentasi lengkap",
      "Mengembangkan perangkat lunak baru"
    ],
    correct: 2,
  ),
  Question(
    question: "Contoh yang paling tepat untuk Adaptive Maintenance adalah:",
    options: [
      "Memperbaiki tampilan antarmuka pengguna",
      "Mengganti database yang digunakan dalam sistem",
      "Menambahkan laporan baru dalam aplikasi",
      "Memperbaiki kesalahan dalam penghitungan"
    ],
    correct: 2,
  ),
  Question(
    question: "Fitur tambahan yang diinginkan pengguna akan dicakup dalam jenis pemeliharaan apa?",
    options: [
      "Corrective Maintenance",
      "Adaptive Maintenance",
      "Perfective Maintenance",
      "Preventive Maintenance"
    ],
    correct: 3,
  ),
  Question(
    question: "Apa yang biasanya dilakukan dalam Corrective Maintenance?",
    options: [
      "Memperbaiki bug dan kesalahan yang ditemukan",
      "Menyusun strategi pemasaran",
      "Membangun perangkat lunak dari awal",
      "Mengimplementasikan sistem baru"
    ],
    correct: 1,
  ),
  Question(
    question: "Perubahan dalam kebijakan bisnis dapat menyebabkan perlunya jenis pemeliharaan yang mana?",
    options: [
      "Corrective Maintenance",
      "Perfective Maintenance",
      "Adaptive Maintenance",
      "Preventive Maintenance"
    ],
    correct: 3,
  ),
  Question(
    question: "Apakah tujuan utama dari Perfective Maintenance?",
    options: [
      "Memperbaiki bug",
      "Meningkatkan efisiensi sistem yang ada",
      "Mengadaptasi perangkat lunak dengan perangkat keras baru",
      "Mengembangkan aplikasi baru"
    ],
    correct: 2,
  ),
  Question(
    question: "Ketika perangkat lunak perlu disesuaikan dengan sistem operasi baru, jenis pemeliharaan yang digunakan adalah:",
    options: [
      "Corrective Maintenance",
      "Adaptive Maintenance",
      "Perfective Maintenance",
      "Preventive Maintenance"
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
        title: Text('Quiz Pemeliharaan dan Evolusi Perangkat Lunak', style: TextStyle(color: Colors.white)), // Ubah warna teks menjadi putih
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