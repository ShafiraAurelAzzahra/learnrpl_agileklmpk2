import 'package:flutter/material.dart';
import 'package:myapp/quiz.dart';

class Quiz1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Pengertian dan Ruang Lingkup Rekayasa Perangkat Lunak',
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
    question: "Apa yang dimaksud dengan Rekayasa Perangkat Lunak (RPL)?",
    options: [
      "Proses pemasaran perangkat lunak",
      "Proses terstruktur dalam merancang, mengembangkan, menguji, dan memelihara perangkat lunak",
      "Proses penjualan perangkat keras",
      "Proses pengoperasian perangkat lunak"
    ],
    correct: 2, // Jawaban yang benar (indeks jawaban)
  ),
  Question(
    question: "Apa tujuan utama dari Rekayasa Perangkat Lunak?",
    options: [
      "Menghasilkan perangkat lunak tanpa bug",
      "Menciptakan perangkat lunak yang sesuai dengan kebutuhan pengguna",
      "Meningkatkan penjualan perangkat lunak",
      "Mengurangi biaya pengembangan perangkat lunak"
    ],
    correct: 2,
  ),
  Question(
    question: "Fase manakah yang termasuk dalam ruang lingkup RPL?",
    options: [
      "Pemasaran produk",
      "Analisis kebutuhan pengguna",
      "Pelatihan pengguna",
      "Penghargaan tim"
    ],
    correct: 2,
  ),
  Question(
    question: "Salah satu dari berikut ini yang bukan merupakan fase dalam RPL adalah:",
    options: [
      "Pengujian",
      "Pemeliharaan",
      "Desain interior",
      "Implementasi"
    ],
    correct: 3,
  ),
  Question(
    question: "Apa yang dimaksud dengan pemeliharaan perangkat lunak?",
    options: [
      "Membangun perangkat lunak baru",
      "Memperbaiki bug dan meningkatkan perangkat lunak setelah pengembangan",
      "Menghapus perangkat lunak yang tidak terpakai",
      "Melatih pengguna untuk menggunakan perangkat lunak"
    ],
    correct: 2,
  ),
  Question(
    question: "Mengapa penting untuk melakukan analisis kebutuhan pengguna dalam RPL?",
    options: [
      "Untuk menentukan harga jual perangkat lunak",
      "Untuk memahami apa yang diinginkan pengguna agar perangkat lunak dapat dirancang sesuai harapan",
      "Untuk mengurangi waktu pengembangan",
      "Untuk meningkatkan kemampuan teknis tim pengembang"
    ],
    correct: 2,
  ),
  Question(
    question: "Salah satu karakteristik perangkat lunak yang baik adalah:",
    options: [
      "Hanya dapat digunakan oleh satu pengguna",
      "Mudah diperbaiki dan dipelihara",
      "Memerlukan biaya tinggi untuk pengembangan",
      "Tidak memerlukan dokumentasi"
    ],
    correct: 2,
  ),
  Question(
    question: "Proses apa yang terjadi setelah implementasi dalam RPL?",
    options: [
      "Pengujian",
      "Pemasaran",
      "Pemeliharaan",
      "Desain"
    ],
    correct: 3,
  ),
  Question(
    question: "Apa yang menjadi fokus utama dalam perancangan sistem pada RPL?",
    options: [
      "Menentukan harga perangkat lunak",
      "Membuat model visual dari perangkat lunak yang akan dibangun",
      "Menghimpun tim pengembang",
      "Menguji kecepatan perangkat keras"
    ],
    correct: 2,
  ),
  Question(
    question: "Keberhasilan Rekayasa Perangkat Lunak diukur dari:",
    options: [
      "Jumlah perangkat lunak yang dijual",
      "Kualitas perangkat lunak yang dihasilkan dan kepuasan pengguna",
      "Banyaknya fitur yang dimiliki perangkat lunak",
      "Biaya yang dikeluarkan untuk pengembangan"
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
        title: Text('Quiz Pengertian dan Ruang Lingkup Rekayasa Perangkat Lunak', style: TextStyle(color: Colors.white)), // Ubah warna teks menjadi putih
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
