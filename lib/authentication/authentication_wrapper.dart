import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/view/UserClassificationScreen.dart';
import 'package:myapp/view/signUpscreen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              //jika berhasil maka akan diarahka ke halaman user classfication
              return const UserClassificationScreen();
            } else {
              //jika gagal maka akan diarahkan ke halaman HomePage
              //return HomePage();
              return Signup();
            }
          }
        },
      ),
    );
  }
}
