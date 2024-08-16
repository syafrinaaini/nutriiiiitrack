import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../exception/auth_exception_handler.dart';

class AuthenticationService {
  AuthResultStatus status = AuthResultStatus.undefined;

  Future<AuthResultStatus> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        status = AuthResultStatus.successful;
      } else {
        status = AuthResultStatus.undefined;
      }
    } catch (msg) {
      status = AuthExceptionHandler.handleException(msg);
    }
    return status;
  }

  // Signup user with email and password
  Future<AuthResultStatus> signupWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final UserCredential authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user != null) {
        _saveUserDetails(
          fullName: fullName,
          email: email,
          userId: authResult.user!.uid,
        );
        status = AuthResultStatus.successful;
      } else {
        status = AuthResultStatus.undefined;
      }
    } catch (msg) {
      status = AuthExceptionHandler.handleException(msg);
    }
    return status;
  }

  void _saveUserDetails(
      {required String fullName,
      required String email,
      required String userId}) {
    // Tambah user details ke Firestore
    FirebaseFirestore.instance.collection('users').doc(userId).set({
      'fullName': fullName,
      'email': email,
      'userId': userId,
    });
  }
}
