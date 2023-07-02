import "package:app/screens/edit_profile.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "login_screen.dart";

class NavDrawer extends StatefulWidget {
  
 
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

List<String> list = <String>['Bus Schedule 1', 'Bus Schedule 2'];

class _NavDrawerState extends State<NavDrawer> {
    Map<String, dynamic>? profileData;

  Future<void> loadProfileData() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var documentSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser!.uid)
        .get();
    setState(() {
      profileData = documentSnapshot.data() as Map<String, dynamic>;
      
    });
  }

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }
  

  @override
  Widget build(BuildContext context) {

    

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(top: 60, left: 7, bottom: 15),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(46, 66, 77, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListTile(
                  style: ListTileStyle.drawer,
                  textColor: const Color(0xd9EAEBED),
                  iconColor: const Color(0xd9EAEBED),
                  leading: const Icon(
                    Icons.account_circle,
                    size: 50,
                    color: Colors.white
                  ),
                  title: Text(
                    profileData!["name"],
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 25,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    profileData!["email"] + "\n" + profileData!["rollno"],
                    style: const TextStyle(fontSize: 17,color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            iconColor: const Color.fromRGBO(46, 66, 77, 1),
            textColor: const Color.fromRGBO(46, 66, 77, 1),
            leading: const Icon(Icons.edit),
            title: const Text("Update Profile"),
            onTap: () => {
              Navigator.push(
                  context,
                  (MaterialPageRoute(
                      builder: (context) => const EditProfileScreen())))
            },
          ),
          ListTile(
            iconColor: const Color.fromRGBO(46, 66, 77, 1),
            textColor: const Color.fromRGBO(46, 66, 77, 1),
            leading: const Icon(Icons.calendar_month),
            //title: const Text("Schedule"),

            onTap: () => {},
          ),
          ListTile(
            iconColor: const Color.fromRGBO(46, 66, 77, 1),
            textColor: const Color.fromRGBO(46, 66, 77, 1),
            leading: const Icon(Icons.chat),
            title: const Text("Query"),
            onTap: () => {},
          ),
          ListTile(
            iconColor: const Color.fromRGBO(46, 66, 77, 1),
            textColor: const Color.fromRGBO(46, 66, 77, 1),
            leading: const Icon(Icons.thumb_up),
            title: const Text("Feedback"),
            onTap: () => {},
          ),
          ListTile(
            iconColor: const Color.fromRGBO(46, 66, 77, 1),
            textColor: const Color.fromRGBO(46, 66, 77, 1),
            leading: const Icon(Icons.person),
            title: const Text("Contact SWB"),
            onTap: () => {},
          ),
          ListTile(
            iconColor: const Color.fromRGBO(46, 66, 77, 1),
            textColor: const Color.fromRGBO(46, 66, 77, 1),
            leading: const Icon(Icons.health_and_safety),
            title: const Text("Privacy Policy"),
            onTap: () => {},
          ),
          ListTile(
            iconColor: const Color.fromRGBO(46, 66, 77, 1),
            textColor: const Color.fromRGBO(46, 66, 77, 1),
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: ((context) => const LoginScreen())));
            },
          ),
        ],
      ),
    );
  }
}
