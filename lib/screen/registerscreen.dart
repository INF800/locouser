import 'package:flutter/material.dart';

import 'package:locouser/utils/display.dart';
import 'package:locouser/screen/loginscreen.dart';

bool validateNewUserDetails(Map controllers) {
  bool valid = false;

  final String name = controllers['name'].text;
  final String email = controllers['email'].text;
  final String phone = controllers['phone'].text;
  final String password = controllers['password'].text;

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
                                  }
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
}
