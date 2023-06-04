import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({super.key});

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff2e424d),
        title: const Text("Notifications",),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
        actions: [
        IconButton(onPressed: (){}, icon:const Icon(Icons.notifications_off)),
        
      ]),
      body: Column(
        children:const [
          ListTile(
            leading: Icon(Icons.donut_small),
            title: Text("Tomorrow bus will not come. Check the bus schedule please."),
            subtitle: Text("Feb 2, 2023 at 9:00 AM"),
          ),
          ListTile(
        leading: Icon(Icons.donut_small),
        title: Text("Tomorrow bus will not come. Check the bus schedule please."),
        subtitle: Text("Feb 2, 2023 at 9:00 AM"),
      ),
        ],
      ),
      
    );
  }
}