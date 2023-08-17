import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata',
      theme: ThemeData(
        primarySwatch:
            Colors.blue, // Ganti dengan warna tema yang Anda inginkan
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplikasi Wisata',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/destination.png'),
              height: 200,
            ),
            const SizedBox(height: 16),
            const Text(
              'Selamat datang di Aplikasi Wisata!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Temukan destinasi wisata terbaik untuk liburan Anda.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DestinationPage.routeName,
                );
              },
              child: const Text('Jelajahi Destinasi Wisata'),
            ),
          ],
        ),
      ),
    );
  }
}

// Destination Page
class DestinationPage extends StatelessWidget {
  static const routeName = '/destination';

  const DestinationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinasi Wisata'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman destinasi wisata.'),
      ),
    );
  }
}
