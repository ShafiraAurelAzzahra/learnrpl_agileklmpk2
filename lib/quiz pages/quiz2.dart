import 'package:flutter/material.dart';
import 'package:myapp/quiz.dart';

class Quiz2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Metodologi Pengembangan Perangkat Lunak',
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
    question: "Apa yang menjadi karakteristik utama dari metodologi Waterfall?",
    options: [
      "Pengembangan bertahap melalui iterasi",
      "Pendekatan linier dengan tahapan yang harus diselesaikan secara berurutan",
      "Fokus pada kolaborasi tim",
      "Memprioritaskan perubahan kebutuhan pengguna"
    ],
    correct: 2, // Jawaban yang benar (indeks jawaban)
  ),
  Question(
    question: "Metodologi mana yang paling cocok digunakan untuk proyek dengan spesifikasi yang jelas sejak awal?",
    options: [
      "Agile",
      "Scrum",
      "Waterfall",
      "Lean"
    ],
    correct: 3,
  ),
  Question(
    question: "Apa fokus utama dari metodologi Agile?",
    options: [
      "Kecepatan pengembangan",
      "Fleksibilitas dan responsif terhadap perubahan",
      "Pengembangan linier",
      "Dokumentasi yang lengkap"
    ],
    correct: 2,
  ),
  Question(
    question: "Dalam Scrum, berapa lama biasanya durasi satu sprint?",
    options: [
      "1-2 hari",
      "1-4 minggu",
      "1 bulan",
      "1-2 tahun"
    ],
    correct: 2,
  ),
  Question(
    question: "Apa yang menjadi tujuan utama dari setiap sprint dalam framework Scrum?",
    options: [
      "Menciptakan produk akhir",
      "Mencapai tujuan sprint yang ditetapkan",
      "Menyusun rencana pengembangan",
      "Mengumpulkan umpan balik dari pengguna"
    ],
    correct: 2,
  ),
  Question(
    question: "Siapa yang biasanya terlibat dalam pengembangan menggunakan metodologi Scrum?",
    options: [
      "Hanya manajer proyek",
      "Tim pengembang, pemilik produk, dan tim scrum",
      "Hanya tim pengembang",
      "Hanya pemilik produk"
    ],
    correct: 2,
  ),
  Question(
    question: "Apa yang menjadi kelemahan utama dari metodologi Waterfall?",
    options: [
      "Sulit diimplementasikan",
      "Terlalu fleksibel",
      "Tidak dapat menangani perubahan kebutuhan dengan baik",
      "Membutuhkan lebih banyak dokumentasi"
    ],
    correct: 3,
  ),
  Question(
    question: "Apa istilah yang digunakan untuk mengacu pada siklus pengembangan perangkat lunak dalam Agile?",
    options: [
      "Prototipe",
      "Sprint",
      "Rencana",
      "Tahap"
    ],
    correct: 2,
  ),
  Question(
    question: "Apa yang menjadi keuntungan utama dari metodologi Agile dibandingkan Waterfall?",
    options: [
      "Lebih cepat dalam pengiriman produk akhir",
      "Lebih mudah dalam pengelolaan proyek",
      "Dapat mengakomodasi perubahan kebutuhan selama proses pengembangan",
      "Memerlukan lebih sedikit sumber daya"
    ],
    correct: 3,
  ),
  Question(
    question: "Apa yang biasanya dilakukan pada akhir setiap sprint dalam Scrum?",
    options: [
      "Rapat evaluasi dan perencanaan untuk sprint berikutnya",
      "Peluncuran produk akhir",
      "Dokumentasi lengkap",
      "Penugasan tugas baru"
    ],
    correct: 1,
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
        title: Text('Quiz Metodologi Pengembangan Perangkat Lunak', style: TextStyle(color: Colors.white)), // Ubah warna teks menjadi putih
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