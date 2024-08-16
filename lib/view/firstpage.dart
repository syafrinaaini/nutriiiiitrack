import 'package:flutter/material.dart';
import 'package:myapp/view/autoslide.dart';

class firstpageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AutoSlideScreen()),
          );
        },
        child: Center(
          child: Image.asset(
            'assets/nutritrackk.png', // Replace with your logo path
            width: 200, // Adjust the size as needed
            height: 200,
          ),
        ),
      ),
    );
  }
}
