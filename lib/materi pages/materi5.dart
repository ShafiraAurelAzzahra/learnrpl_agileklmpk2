import 'package:flutter/material.dart';

class Materi5Screen extends StatelessWidget {
  const Materi5Screen({Key? key}) : super(key: key);

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
          "Pemeliharaan dan Evolusi Perangkat Lunak",
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
          _buildButton(context, "Corrective Maintenance"),
          SizedBox(height: 15),
          _buildDescription(
            context,
            "Corrective Maintenance adalah perbaikan bug atau kesalahan yang ditemukan setelah perangkat lunak dirilis untuk memastikan sistem tetap berjalan dengan baik.",
          ),
          SizedBox(height: 15),
          _buildButton(context, "Adaptive Maintenance"),
          SizedBox(height: 15),
          _buildDescription(
            context,
            "Adaptive Maintenance melibatkan modifikasi perangkat lunak agar dapat beradaptasi dengan perubahan di lingkungan teknis atau kebutuhan bisnis yang baru.",
          ),
          SizedBox(height: 15),
          _buildButton(context, "Perfective Maintenance"),
          SizedBox(height: 15),
          _buildDescription(
            context,
            "Perfective Maintenance dilakukan untuk menambah fitur baru atau meningkatkan performa perangkat lunak, seiring dengan perubahan kebutuhan pengguna dan perkembangan teknologi.",
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
