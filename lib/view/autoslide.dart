import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myapp/view/start.dart'; // Import your Halaman1.dart file

class AutoSlideScreen extends StatefulWidget {
  @override
  _AutoSlideScreenState createState() => _AutoSlideScreenState();
}

class _AutoSlideScreenState extends State<AutoSlideScreen> {
  final PageController _pageController = PageController();
  Timer? _timer;

  List<Map<String, String>> pages = [
    {
      'image': 'assets/slide1.png',
      'title': 'Penuhi Nutrisi, Pantau BMI',
      'subtitle':
          'Penuhi nutrisi anda dengan memperhatikan BMI agar berat badan ideal',
    },
    {
      'image': 'assets/slide2.png',
      'title': 'Scan Your Food',
      'subtitle':
          'Pantau kandungan nutrisi di setiap asupan makananmu dengan deteksi makanan',
    },
    {
      'image': 'assets/slide3.png',
      'title': 'Monitor Your Nutrition',
      'subtitle':
          'Perhatikan asupan nutrisi dengan baik setiap hari agar pertumbuhan anak menjadi optimal!',
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      int nextPage = (_pageController.page?.round() ?? 0) + 1;
      if (nextPage == pages.length) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToHalaman1() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetStartedScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      pages[index]['image']!, // Path gambar dari list pages
                      width: 250, // Atur lebar gambar
                      height: 250, // Atur tinggi gambar
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 20),
                    Text(
                      pages[index]['title']!, // Judul halaman
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        pages[index]['subtitle']!, // Subjudul halaman
                        maxLines: 3, // Maksimum 3 baris
                        overflow: TextOverflow
                            .ellipsis, // Tampilkan elipsis jika lebih dari 3 baris
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign
                            .center, // Aligment teks menjadi rata tengah
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed:
                          _navigateToHalaman1, // Changed to navigate to Halaman1
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF670274), // Warna ungu
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '12:00',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
