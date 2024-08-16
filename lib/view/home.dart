import 'package:flutter/material.dart';
import 'package:myapp/view/attribute/detailhome.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ... (Previous code remains the same)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (AppBar remains the same)

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... (Top section remains the same)

            // Recommended food section
            SizedBox(height: 20.0),
            Text('Rekomendasi Makanan Sehat',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailhome(
                          title: 'Sayuran',
                          description:
                              'Membantu mengontrol asupan kalori dan memberikan serat yang penting untuk pencernaan.',
                          imageUrl:
                              'https://cdn.pixabay.com/photo/2016/09/10/18/21/vegetables-1649414_960_720.jpg',
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4.0,
                    child: Container(
                      height: 150.0,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://cdn.pixabay.com/photo/2016/09/10/18/21/vegetables-1649414_960_720.jpg',
                            height: 100.0,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10.0),
                          Text('Sayuran'),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailhome(
                          title: 'Buah-buahan',
                          description:
                              'Sumber vitamin, mineral, dan antioksidan yang penting untuk kesehatan.',
                          imageUrl:
                              'https://cdn.pixabay.com/photo/2017/06/09/16/12/fruit-2266681_960_720.jpg',
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4.0,
                    child: Container(
                      height: 150.0,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://cdn.pixabay.com/photo/2017/06/09/16/12/fruit-2266681_960_720.jpg',
                            height: 100.0,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10.0),
                          Text('Buah-buahan'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Recent meals section
            SizedBox(height: 20.0),
            Text('Makanan Terbaru',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3, // Replace with actual meal data
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    'https://cdn.pixabay.com/photo/2018/04/09/18/26/chicken-326743_960_720.jpg',
                    height: 40.0,
                    width: 40.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Nasi Goreng'),
                  subtitle: Text('15 menit yang lalu'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
