import 'package:flutter/material.dart';

class Materi2Screen extends StatelessWidget {
  const Materi2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                _buildIntroductionSection(context),
                SizedBox(height: 10),
                Divider(
                  thickness: 2,
                  color: Color(0XFF083791),
                  indent: 12,
                  endIndent: 12,
                ),
                SizedBox(height: 20),
                _buildContentSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget _buildIntroductionSection(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      IconButton(
        icon: Icon(Icons.arrow_back, color: Color(0XFF083791)),
        onPressed: () {
          Navigator.of(context).pop(); // Fungsi untuk kembali ke halaman sebelumnya
        },
      ),
      SizedBox(width: 8),
      Flexible(
        child: Text(
          "Metodologi Pengembangan Perangkat Lunak",
          style: TextStyle(
            color: Color(0XFF083791),
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );
}

  Widget _buildContentSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0XFF083791),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildButton(context, "Waterfall"),
          SizedBox(height: 15),
          _buildDescription(
            context,
            "Metodologi Waterfall merupakan pendekatan linier di mana setiap tahap pengembangan harus diselesaikan sebelum beralih ke tahap berikutnya. Cocok untuk proyek dengan spesifikasi yang jelas sejak awal.",
          ),
          SizedBox(height: 15),
          _buildButton(context, "Agile"),
          SizedBox(height: 15),
          _buildDescription(
            context,
            "Agile adalah metodologi pengembangan perangkat lunak yang berfokus pada fleksibilitas, dengan pengembangan bertahap melalui iterasi singkat (sprint). Metode ini sangat efektif untuk menghadapi perubahan kebutuhan pengguna.",
          ),
          SizedBox(height: 15),
          _buildButton(context, "Scrum"),
          SizedBox(height: 15),
          _buildDescription(
            context,
            "Scrum adalah framework dalam Agile yang membagi pengembangan perangkat lunak menjadi sprint yang biasanya berdurasi 1-4 minggu. Tim berkolaborasi untuk mencapai tujuan sprint yang ditetapkan.",
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0XFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: Color(0XFF083791),
          fontSize: 18,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context, String description) {
    return Text(
      description,
      style: TextStyle(
        color: Color(0XFFFFFFFF),
        fontSize: 14,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.justify,
    );
  }

  }

  BottomNavigationBarItem _buildNavBarItem(String assetPath, String label) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Image.asset(
            assetPath,
            height: 30,
            width: 30,
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
      label: '',
    );
  }
