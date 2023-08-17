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
        primarySwatch: Colors.blue,
      ),
      // Daftarkan rute untuk halaman-halaman di sini
      routes: {
        '/': (context) => const HomePage(),
        DestinationPage.routeName: (context) => DestinationPage(),
      },
      initialRoute: '/',
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
              image: AssetImage('assets/images/logo.png'),
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

class Destination {
  final String name;
  final String img;
  final String description;
  Destination({
    required this.name,
    required this.description,
    required this.img, // Tambahkan img sebagai parameter wajib
  });
}

class DestinationPage extends StatelessWidget {
  static const routeName = '/destination';

  final List<Destination> destinations = [
    Destination(
      name: 'Pantai Kuta',
      img: 'assets/images/logo.png',
      description:
          'Nikmati pasir putih dan ombak di Pantai Kuta yang terkenal.',
    ),
    Destination(
      name: 'Candi Borobudur',
      img: 'assets/images/logo.png',
      description:
          'Eksplorasi keindahan Candi Borobudur, salah satu keajaiban dunia.',
    ),
    Destination(
      name: 'Danau Toba',
      img: 'assets/images/logo.png',
      description:
          'Nikmati pemandangan indah danau terbesar di Indonesia, Danau Toba.',
    ),
    // Tambahkan destinasi lainnya sesuai keinginan Anda
  ];

  DestinationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinasi Wisata'),
      ),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(destinations[index].img),
            title: Text(destinations[index].name),
            subtitle: Text(destinations[index].description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DestinationDetailPage(destination: destinations[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DestinationDetailPage extends StatelessWidget {
  final Destination destination;

  const DestinationDetailPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(destination.img),
          const SizedBox(height: 20),
          Text(destination.description),
        ],
      ),
    );
  }
}
