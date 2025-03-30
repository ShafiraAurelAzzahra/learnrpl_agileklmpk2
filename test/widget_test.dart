import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:myapp/main.dart'; // Pastikan ini benar
import 'package:myapp/home_screen.dart'; // Impor HomeScreen jika perlu

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester
        .pumpWidget(GetMaterialApp(home: HomeScreen())); // Jalankan aplikasi
    await tester.pumpAndSettle(); // Tunggu semua rendering selesai

    // Debug: Cek apakah halaman HomeScreen muncul
    print(
        "Widget ditemukan di layar: ${find.text('Hi Good People !').evaluate().length}");

    // Jika ada halaman awal, klik tombol untuk masuk ke HomeScreen
    if (find.text("Get Started").evaluate().isNotEmpty) {
      await tester.tap(find.text("Get Started"));
      await tester.pumpAndSettle();
    }

    // Cek apakah ada angka "0" di layar
    print("Jumlah widget dengan teks '0': ${find.text('0').evaluate().length}");

    // Debug: Jika tidak ditemukan, tampilkan semua widget yang ada
    if (find.text('0').evaluate().isEmpty) {
      print("Widget '0' tidak ditemukan. Widget yang ada di layar:");
      tester.allWidgets.forEach((widget) => print(widget.toString()));
    }

    // Pastikan angka "0" ada di layar sebelum menekan tombol
    expect(find.text('0'), findsOneWidget,
        reason: "Counter harus dimulai dari 0");

    // Ketuk tombol tambah
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Pastikan angka berubah menjadi "1"
    expect(find.text('0'), findsNothing,
        reason: "Angka 0 harus hilang setelah tombol ditekan");
    expect(find.text('1'), findsOneWidget,
        reason: "Counter harus berubah menjadi 1");
  });
}
