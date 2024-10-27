import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String username; // Variabel untuk menyimpan username

  // Menerima username melalui konstruktor
  const DashboardPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan pesan selamat datang dengan username
            Text(
              'Selamat Datang di MyGuna, $username!', // Menampilkan username
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Kembali ke halaman Login
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
