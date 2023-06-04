import 'package:app/screens/side_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const NavDrawer(),
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: ((context) => const LoginScreen())));
                },
                child: const Text("signout")),
            const Text(
              'Homepage',
              style: TextStyle(fontSize: 50),
            ),
          ],
        )),
      ),
    );
  }
}
