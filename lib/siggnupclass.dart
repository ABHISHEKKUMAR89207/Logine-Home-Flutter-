// ignore_for_file: avoid_print, prefer_const_constructors, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

signUpUser(String userPhone, String userEmail, String userPassword) async {
  User? userid = FirebaseAuth.instance.currentUser;
  try {
    await FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
      'userPhone': userPhone,
      'userEmail': userEmail,
      'createdAt': DateTime.now(),
      'userId': userid.uid,
    }).then((value) => {
          // FirebaseAuth.instance.signOut(),
          // Get.to(() => LogineScreen()),
        });
  } on FirebaseAuthException catch (e) {
    print("error $e");
  }
}
