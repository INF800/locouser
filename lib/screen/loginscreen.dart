import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:locouser/utils/display.dart';
import 'package:locouser/screen/registerscreen.dart';
import 'package:locouser/screen/mainscreen.dart';
import 'package:locouser/main.dart';



class LoginScreen extends StatefulWidget {
  static const String screenId = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                      'Welcome Onboard 🤪',
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
                            // email field
                            SizedBox(
                              height: 1.0,
                            ),
                            TextField(
                              controller: _emailController,
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
                              controller: _passwordController,
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

                            // login button
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
                                      "Login",
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
                                  authenticateAndLoginUser(context);
                                }),
                          ],
                        )),

                    // todo: forgot password

                    // signup
                    FlatButton(
                        child: Text(
                            "Do not have an account? Click here to register."),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              RegisterScreen.screenId, (route) => false);
                        }),
                  ],
                ))));
  }

  /// login and auth user
  FirebaseAuth _auth = FirebaseAuth.instance;
  void authenticateAndLoginUser(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    UserCredential cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).catchError((e) {
      displaySimpleToastMessage(e.message);
    });


    if (cred.user != null) {

      User user = cred.user!;

      // check if user exists in database
      UserDB.child(user.uid)
        .once()
        .then((DataSnapshot snap){
          if (snap.value != null){
            displaySimpleToastMessage("Logged in successfully");
            Navigator.pushNamedAndRemoveUntil(context, MainScreen.screenId, (route) => false);
          } else {
            _auth.signOut();
            displaySimpleToastMessage("User does not exist in database. Check details or create new account.");
          }
        })
        .catchError((e) {
          displaySimpleToastMessage("Error: " + e.message);
        });

    }


  }
}
