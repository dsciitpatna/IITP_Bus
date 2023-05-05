import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      body:  Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: ()async{
              await FirebaseAuth.instance.signOut();
               Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const LoginScreen())));
            }, child: const Text("signout")),
            const Text('Homepage',style: TextStyle(fontSize: 50),),
          ],
        )
        ),
    );
  }
}