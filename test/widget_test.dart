import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterdart_app/login_page.dart';
import 'package:flutterdart_app/dashboard_page.dart';

void main() {
  group('LoginPage Widget Test', () {
    testWidgets('Tampilkan judul dan elemen login dengan benar',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      // Memastikan judul pada AppBar adalah "Login"
      expect(find.text('Login').at(0), findsOneWidget); // AppBar title

      // Memastikan terdapat TextField untuk username dan password
      expect(find.byType(TextField), findsNWidgets(2));

      // Memastikan terdapat satu ElevatedButton dengan label "Login"
      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    });

    testWidgets('Menampilkan halaman Dashboard ketika login berhasil',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      // Masukkan teks pada TextField username dan password
      await tester.enterText(
          find.byType(TextField).at(0), 'adegun'); // Username yang benar
      await tester.enterText(
          find.byType(TextField).at(1), '12345678'); // Password yang benar

      // Tekan tombol login
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pumpAndSettle(); // Tunggu sampai animasi navigasi selesai

      // Memastikan pengguna berada di halaman Dashboard
      expect(find.byType(DashboardPage), findsOneWidget);
      expect(find.text('Selamat Datang di MyGuna!'), findsOneWidget);
      expect(find.text('Username: adegun'),
          findsOneWidget); // Memastikan username tampil di Dashboard
    });

    testWidgets('Menampilkan dialog gagal ketika login salah',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      // Masukkan teks yang salah pada TextField username dan password
      await tester.enterText(find.byType(TextField).at(0), 'user');
      await tester.enterText(find.byType(TextField).at(1), 'wrongpassword');

      // Tekan tombol login
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pump(); // Render ulang setelah menekan tombol

      // Memastikan dialog gagal muncul
      expect(find.text('Login Gagal'), findsOneWidget);
      expect(find.text('Username atau password salah'), findsOneWidget);
    });
  });
}
