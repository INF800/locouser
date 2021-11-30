import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:locouser/screen/mainscreen.dart';
import 'package:locouser/screen/loginscreen.dart';
import 'package:locouser/screen/registerscreen.dart';

// DatabaseReference UserDB = FirebaseDatabase.instance.reference().child("Users");
DatabaseReference UserDB = FirebaseDatabase.instance.reference().child("Users");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  /// root widget app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loco Loves You!',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MainScreen(),
      // home: LoginScreen(),
      // home: RegisterScreen(),
      initialRoute: LoginScreen.screenId,
      routes: {
        MainScreen.screenId: (context) => MainScreen(),
        LoginScreen.screenId: (context) => LoginScreen(),
        RegisterScreen.screenId: (context) => RegisterScreen(),
      },
    );
  }
}
