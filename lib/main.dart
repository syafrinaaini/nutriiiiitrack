import 'package:flutter/material.dart';
import 'package:myapp/view/ForgotPassword.dart';
import 'package:myapp/view/UserClassification2.dart';
import 'package:myapp/view/UserClassificationScreen.dart';
import 'package:myapp/view/autoslide.dart';
import 'package:myapp/view/firstpage.dart';
import 'package:myapp/view/halaman1.dart';
import 'package:myapp/view/home.dart';
import 'package:myapp/view/loginScreen.dart';
import 'package:myapp/view/signUpscreen.dart';
import 'package:myapp/view/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutritrack',
      debugShowCheckedModeBanner: false,
      home: firstpageScreen(),
      routes: {
        '/logincreen': (context) => LoginPage(),
        '/signUpScreen': (context) => Signup(),
        '/autoslide_screen': (context) => AutoSlideScreen(),
        '/halaman1': (context) => Halaman1(),
        '/home.dart': (context) => HomePage(),
        '/start.dart': (context) => GetStartedScreen(),
        '/UserClassificationScreen': (context) => UserClassificationScreen(),
        '/firstpage': (context) => firstpageScreen(),
        '/ForgotPassword': (context) => ForgotPasswordScreen(),
        '/UserClassification2': (context) => UserClassificationNext(),
      },
    );
  }
}
