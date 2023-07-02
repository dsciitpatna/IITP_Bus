
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Firestore {
  void storeData(
      {required String name,
      required String rollno,
      required String phoneno,
      required String email}) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    try {
      FirebaseFirestore.instance
          .collection("users")
          .doc(firebaseUser!.uid)
          .set({
        "name": name,
        "rollno": rollno,
        "email": email,
        "phone": phoneno
      }).then((_) {});
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  //showProgressIndicator = true;

  Future<Map<String, dynamic>> fetchData() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  var documentSnapshot = await FirebaseFirestore.instance.collection("users").doc(firebaseUser!.uid).get();
  return documentSnapshot.data() as Map<String, dynamic>;
}
}
