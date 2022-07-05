import 'package:flutter/material.dart';
import 'package:login_screen/ForgotPassword_Screen.dart';
import 'package:login_screen/Signup_Screen.dart';
import 'package:login_screen/Welcome.dart';
import 'Login_Screen.dart';
void main(){
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
            primaryColor: Colors.brown
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>Login_Screen(),
        '/Signup':(context)=>Signup_Screen(),
        '/Forgot':(context)=>ForgotPaaaword_Screen(),
        '/Welcome':(context)=>Welcome_Screen(),
      },
    ),
  );
}