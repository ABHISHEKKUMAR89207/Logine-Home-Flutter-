// ignore_for_file: prefer_const_constructors, file_names, avoid_unnecessary_containers, duplicate_ignore, avoid_print
import 'package:assignment/logine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController forgotPasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.5),
        centerTitle: true,
        title: const Text(
          "FORGOT PASSWORD",
          style: TextStyle(color: Colors.white),
        ),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                color: Colors.grey[200],
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: forgotPasswordcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 114, 215, 134),
                    ),
                    suffixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 114, 215, 134),
                    ),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 198, 65, 28),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  ),
                  onPressed: () async {
                    var forgotEmail = forgotPasswordcontroller.text.trim();
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: forgotEmail)
                          .then((value) => {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => LogineScreen(),
                                  ),
                                )
                              });
                    } on FirebaseAuthException catch (e) {
                      print("error $e");
                    }
                  },
                  child: Text(
                    "Forgot Password",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
