import 'package:flutter/material.dart'; // Mengimpor Material Design package.
import 'package:flutter_test/flutter_test.dart'; // Mengimpor Flutter Test untuk melakukan pengujian widget.

import 'package:myapp/main.dart'; // Mengimpor file utama aplikasi.

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Fungsi main() yang menjalankan test case dengan deskripsi "Counter increments smoke test".
    
    await tester.pumpWidget(MyApp()); 
    // Menginisialisasi widget `MyApp` ke dalam tester. Ini seperti menjalankan aplikasi untuk pengujian.

    expect(find.text('0'), findsOneWidget); 
    // Memeriksa apakah teks '0' ditemukan satu kali di layar (counter dimulai dari 0).
    
    expect(find.text('1'), findsNothing); 
    // Memeriksa apakah teks '1' tidak ditemukan di layar (karena belum ditambah).

    await tester.tap(find.byIcon(Icons.add)); 
    // Menemukan tombol dengan ikon 'add' (plus) dan mensimulasikan ketukan.

    await tester.pump(); 
    // Memicu frame baru untuk memperbarui tampilan setelah ketukan tombol.

    expect(find.text('0'), findsNothing); 
    // Memeriksa apakah teks '0' tidak ditemukan lagi setelah counter ditambah.
    
    expect(find.text('1'), findsOneWidget); 
    // Memeriksa apakah teks '1' ditemukan satu kali di layar setelah counter ditambah.
  });
}
