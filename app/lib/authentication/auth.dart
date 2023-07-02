import 'package:app/database/firestore.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/login_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  Future<void> loginwithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      Fluttertoast.showToast(msg: 'Login Successfull').then((value) =>
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => const HomePage()))));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Inavalid Password!");
      } else if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found with this email!");
      } else {
        Fluttertoast.showToast(msg: e.message!);
      }
    }
  }

  Future<void> signupwithEmail({
    required String email,
    required String password,
    required String name,
    required String rollno,
    required String phoneno,
    required BuildContext context,
  }) async {
    try {
      await _authInstance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await value.user!.sendEmailVerification();
        Firestore().storeData(
            name: name, rollno: rollno, phoneno: phoneno, email: email);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const LoginScreen())));

        Fluttertoast.showToast(msg: 'Verification email sent');
        if (_authInstance.currentUser!.emailVerified) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  const Text('Email verified, Account created successfully')));
        }
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: e.message!);
    }
  }

  Future<void> passwordForgot({required String email}) async {
    try {
      await _authInstance.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(msg: "Password rest email sent !");
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
