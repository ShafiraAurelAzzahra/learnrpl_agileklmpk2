import 'package:intl/date_symbol_data_local.dart'; 
// Mengimpor package intl yang menyediakan fungsionalitas format dan parsing tanggal/waktu, termasuk dukungan untuk berbagai locale.

import 'package:intl/intl.dart'; 
// Mengimpor bagian dari package intl untuk melakukan format dan parsing tanggal.

const String dateTimeFormatPattern = 'dd/MM/yyyy'; 
// Mendefinisikan pola format tanggal default (dd/MM/yyyy), yang akan digunakan jika pola lain tidak diberikan.

extension DateTimeExtension on DateTime {
  // Membuat extension pada kelas `DateTime` untuk menambahkan fungsi baru yang disebut `format`.
  
  String format({
    String pattern = dateTimeFormatPattern, // Pola format default diambil dari `dateTimeFormatPattern`.
    String? locale, // Parameter opsional `locale` untuk menentukan locale yang ingin digunakan saat memformat.
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale); 
      // Menginisialisasi format tanggal dengan locale tertentu jika diberikan dan tidak kosong.
    }
    return DateFormat(pattern, locale).format(this); 
    // Menggunakan DateFormat dari package intl untuk memformat objek DateTime sesuai dengan pola dan locale yang diberikan.
  }
}
