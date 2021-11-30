import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:locouser/utils/display.dart';
import 'package:locouser/main.dart';
import 'package:locouser/screen/loginscreen.dart';

bool validateNewUserDetails(Map controllers) {
  bool valid = true;

  final String name = controllers['name'].text;
  final String email = controllers['email'].text;
  final String phone = controllers['phone'].text;
  final String password = controllers['password'].text;

  if (name.length < 4) {
    valid = false;
    displaySimpleToastMessage('Name must be atleast 4 characters');
  }

  if (!email.contains('@') || !email.contains('.')) {
    valid = false;
    displaySimpleToastMessage('Email must be valid');
  }

  if (phone.length != 10) {
    valid = false;
    displaySimpleToastMessage('Phone number must be 10 digits');
  }

  // if (password.length < 6) {
  //   valid = false;
  //   displaySimpleToastMessage('Password must be atleast 6 characters');
  // }

  // todo: validations
  return valid;
}

class RegisterScreen extends StatefulWidget {
  static const String screenId = 'register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var textEditingControllers = {
    'email': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
    'name': TextEditingController(),
    'phone': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        // SingleChildScrollView makes sure thaT
        // app works smoothly when keyboard is open
        // and when we have wide variety of screen sizes
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // logo
                    SizedBox(
                      height: 35.0,
                    ),
                    Image(
                      image: AssetImage('images/logo1.png'),
                      height: 250.0,
                      width: MediaQuery.of(context).size.width * 1.0,
                      alignment: Alignment.center,
                    ),

                    // logo text
                    SizedBox(
                      height: 1.0,
                    ),
                    Text(
                      'Create an Account!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: "Bolt Semibold",
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // login form
                    Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            // Name field
                            SizedBox(
                              height: 1.0,
                            ),
                            TextField(
                              controller: textEditingControllers['name'],
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),

                            // Phone field
                            SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                              controller: textEditingControllers['phone'],
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Phone',
                                hintStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),

                            // email field
                            SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                              controller: textEditingControllers['email'],
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),

                            // password field
                            SizedBox(
                              height: 10.0,
                            ),
                            TextField(
                              controller: textEditingControllers['password'],
                              obscureText: true,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontSize: 14.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),

                            // signup button
                            SizedBox(
                              height: 10.0,
                            ),
                            RaisedButton(
                                color: Colors.orange,
                                textColor: Colors.white,
                                child: Container(
                                  height: 50.0,
                                  child: Center(
                                    child: Text(
                                      "Create Account",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: "Bolt Semibold",
                                      ),
                                    ),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                onPressed: () {
                                  bool valid = validateNewUserDetails(textEditingControllers);
                                  if (valid != true) {
                                    displaySimpleToastMessage("Details not valid");
                                    return;
                                  }

                                  registerNewUser(textEditingControllers);
                                }),
                          ],
                        )),

                    // todo: forgot password

                    // signup
                    FlatButton(
                        child: Text("Already have an account? Click here to signin."),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.screenId, (route) => false);
                        }),
                  ],
                ))));
  }

  /// add new user
  FirebaseAuth _auth = FirebaseAuth.instance;
  void registerNewUser(Map<String, TextEditingController> textEditingControllers) async {
    String name = textEditingControllers['name']!.text.trim();
    String phone = textEditingControllers['phone']!.text.trim();
    String email = textEditingControllers['email']!.text.trim();
    String password = textEditingControllers['password']!.text.trim();

    UserCredential cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).catchError((e) {
      displaySimpleToastMessage(e.message);
    });

    if (cred.user==null) {
      displaySimpleToastMessage("Not saving to database");
      return;
    }

    User user = cred.user!;
    Map userData = {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "uid": user.uid,
    };

    print(userData);

    UserDB.child(user.uid).set(userData).catchError((e) {
      print("error saving to database: " + e.message);
      displaySimpleToastMessage("Error: " + e.message);
    });

    print("created user!!!!!!!!!!!!!!!!!!!!!!");

  }
}
