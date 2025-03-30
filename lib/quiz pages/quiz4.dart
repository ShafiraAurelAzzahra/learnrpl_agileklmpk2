import 'package:flutter/material.dart';
import 'package:myapp/quiz.dart';

class Quiz4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Pengujian dan Jaminan Kualitas (Quality Assurance)',
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
    question: "Apa tujuan utama dari pengujian perangkat lunak?",
    options: [
      "Meningkatkan jumlah pengguna",
      "Memastikan perangkat lunak berfungsi sesuai harapan",
      "Mengurangi waktu pengembangan",
      "Meningkatkan penjualan perangkat lunak"
    ],
    correct: 2, // Jawaban yang benar (indeks jawaban)
  ),
  Question(
    question: "Pengujian yang dilakukan pada bagian terkecil dari perangkat lunak disebut:",
    options: [
      "Pengujian sistem",
      "Pengujian integrasi",
      "Pengujian unit",
      "Pengujian penerimaan"
    ],
    correct: 3,
  ),
  Question(
    question: "Apa yang dimaksud dengan pengujian integrasi?",
    options: [
      "Pengujian bagian-bagian kecil secara individual",
      "Pengujian keseluruhan sistem perangkat lunak",
      "Pengujian interaksi antara beberapa komponen perangkat lunak",
      "Pengujian oleh pengguna akhir"
    ],
    correct: 3,
  ),
  Question(
    question: "Manakah dari berikut ini yang merupakan keuntungan pengujian otomatis?",
    options: [
      "Pengujian lebih lambat dibandingkan pengujian manual",
      "Memerlukan keterampilan teknis tinggi",
      "Mengurangi kemungkinan kesalahan manusia",
      "Selalu lebih mahal"
    ],
    correct: 3,
  ),
  Question(
    question: "Proses Quality Assurance (QA) bertujuan untuk:",
    options: [
      "Meningkatkan biaya pengembangan perangkat lunak",
      "Memastikan setiap langkah pengembangan memenuhi standar kualitas",
      "Mengurangi komunikasi antar tim",
      "Menghilangkan kebutuhan pengujian"
    ],
    correct: 2,
  ),
  Question(
    question: "Apa yang termasuk dalam proses jaminan kualitas?",
    options: [
      "Hanya pengujian unit",
      "Review kode, audit, dan pemantauan kinerja",
      "Hanya pengujian penerimaan",
      "Pengembangan tanpa pengujian"
    ],
    correct: 2,
  ),
  Question(
    question: "Pengujian yang dilakukan oleh pengguna akhir sebelum perangkat lunak dirilis disebut:",
    options: [
      "Pengujian sistem",
      "Pengujian penerimaan",
      "Pengujian unit",
      "Pengujian integrasi"
    ],
    correct: 2,
  ),
  Question(
    question: "Salah satu kelemahan pengujian manual adalah:",
    options: [
      "Memungkinkan untuk menemukan kesalahan lebih awal",
      "Memerlukan waktu lebih banyak dibandingkan pengujian otomatis",
      "Tidak memerlukan keterampilan teknis",
      "Lebih murah daripada pengujian otomatis"
    ],
    correct: 2,
  ),
  Question(
    question: "Apa manfaat utama dari audit dalam proses Quality Assurance?",
    options: [
      "Meningkatkan keuntungan perusahaan",
      "Menjamin kualitas produk perangkat lunak",
      "Mengurangi kebutuhan pengujian",
      "Menghilangkan risiko proyek"
    ],
    correct: 2,
  ),
  Question(
    question: "Pengujian sistem berfokus pada:",
    options: [
      "Memastikan bagian-bagian kecil berfungsi dengan baik",
      "Interaksi antara beberapa komponen",
      "Memastikan keseluruhan sistem berfungsi sesuai spesifikasi",
      "Pengujian oleh pengguna akhir"
    ],
    correct: 3,
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
        title: Text('Quiz Pengujian dan Jaminan Kualitas (Quality Assurance)', style: TextStyle(color: Colors.white)), // Ubah warna teks menjadi putih
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
