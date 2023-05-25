import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'login_screen.dart';
import 'navbar.dart';
import 'notification_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(46, 66, 77, 1),
          centerTitle: true,
          title: const Text(
            'IITP BUS',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sarabun'

            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const NotificationScreen())));
              },
            ),
          ],
        ),
        body: Column(
          children: const [
            Image(
              image: AssetImage('assets/images/bus.png'),
              ),
              ]
        )
      ),
    );
  }
}
