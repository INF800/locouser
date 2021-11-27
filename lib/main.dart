import 'package:flutter/material.dart';
import 'package:locouser/screen/mainscreen.dart';
import 'package:locouser/screen/loginscreen.dart';
import 'package:locouser/screen/registerscreen.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  /// root widget app
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loco Loves You!',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
      // home: LoginScreen(),
      // home: RegisterScreen(),
    );
  }
}
