import 'package:flutter/material.dart';

class Materi3Screen extends StatelessWidget {
  const Materi3Screen({Key? key}) : super(key: key);

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
          "Analisis dan Perancangan Perangkat Lunak",
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
          _buildButton(context, "Analisis Kebutuhan"),
          SizedBox(height: 15),
          _buildDescription(
            context,
            "Tahap analisis kebutuhan melibatkan identifikasi kebutuhan pengguna dan spesifikasi sistem yang akan dikembangkan. Ini merupakan tahap penting untuk memastikan perangkat lunak sesuai dengan harapan pengguna.",
          ),
          SizedBox(height: 15),
          _buildButton(context, "Perancangan Sistem"),
          SizedBox(height: 15),
          _buildDescription(
            context,
            "Perancangan sistem meliputi pembuatan desain arsitektur perangkat lunak, termasuk diagram UML seperti Use Case, Sequence Diagram, dan ERD untuk menggambarkan komponen sistem secara visual.",
          ),
          SizedBox(height: 15),
          _buildButton(context, "Prototyping"),
          SizedBox(height: 15),
          _buildDescription(
            context,
            "Prototyping adalah teknik yang digunakan untuk membuat versi awal perangkat lunak dengan tujuan memberikan gambaran kasar kepada pengguna tentang bagaimana sistem akan berfungsi.",
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
