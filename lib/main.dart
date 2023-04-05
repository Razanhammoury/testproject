import 'package:flutter/material.dart';
import 'package:untitled2/Profile.dart';
import 'Doctor_Profile.dart';
import 'login_screen.dart';
import 'home_screen.dart';
void main()
{
  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  // constructor
  // build

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Doctor_Profile(),




    );
  }
}