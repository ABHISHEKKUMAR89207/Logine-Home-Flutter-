import 'package:assignment/Forgot.dart';
import 'package:assignment/HomeScreen.dart';

import 'package:assignment/siggnupclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogineScreen(),
    );
  }
}

class LogineScreen extends StatelessWidget {
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  bool _isPasswordVisible = false;

  void _showBottomSheet(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    TextEditingController userPasswoController = TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                right: 16.0,
                top: 16.0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 226, 227, 227),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: EmailController,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 226, 227, 227),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: PhoneNumberController,
                    decoration: InputDecoration(
                      hintText: "Enter Number",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 226, 227, 227),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: userPasswoController,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      var userPhone = PhoneNumberController.text.trim();
                      var userEmail = EmailController.text.trim();
                      var userPassword = userPasswoController.text.trim();
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: userEmail, password: userPassword)
                          .then((value) =>
                              {signUpUser(userPhone, userEmail, userPassword)});
                      Navigator.of(context).pop();
                      PhoneNumberController.text = '';
                      EmailController.text = '';
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 198, 65, 28),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    ),
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
    );
  }

  void Logine(BuildContext context) {
    TextEditingController PasswoController = TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                right: 16.0,
                top: 16.0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.0),
                Text(
                  "Enter Passward Number",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 226, 227, 227),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: PasswoController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                          // });
                        },
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _isPasswordVisible ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      var loginePassword = PasswoController.text.trim();
                      var email = EmailController.text.trim();
                      try {
                        final User? firebaseUser = (await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email, password: loginePassword))
                            .user;
                        if (firebaseUser != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShoppingHomePage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Incorrect email or password"),
                            ),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        print("error $e");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 198, 65, 28),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    ),
                    child: Text(
                      'Verify Password',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(12),
              color: Colors.orange,
              height: double.infinity,
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Logine",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90.0),
                  topRight: Radius.circular(90.0),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 80.0),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      width: 320,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 232, 190, 127),
                            blurRadius: 17,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter Phone Number",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'assets/flag.png',
                                  width: 40.0,
                                  height: 40.0,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  "+91",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 22.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: PhoneNumberController,
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                        hintText: "Enter a number",
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () async {
                        final phoneNumber = PhoneNumberController.text.trim();
                        if (phoneNumber.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please enter a phone number"),
                            ),
                          );
                          return;
                        }

                        if (phoneNumber.length != 10 ||
                            int.tryParse(phoneNumber) == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Please enter a valid 10-digit phone number"),
                            ),
                          );
                          return;
                        }

                        try {
                          final querySnapshot = await FirebaseFirestore.instance
                              .collection('users')
                              .where('userPhone',
                                  isEqualTo: PhoneNumberController.text)
                              .get();

                          if (querySnapshot.docs.isNotEmpty) {
                            EmailController.text =
                                querySnapshot.docs[0]['userEmail'];
                            Logine(context);
                          } else {
                            _showBottomSheet(context);
                          }
                        } catch (e) {
                          print('Error checking phone number: $e');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 198, 65, 28),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                      ),
                      child: Text(
                        'Proceed',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
