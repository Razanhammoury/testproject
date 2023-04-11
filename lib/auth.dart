import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/Doctor_Profile.dart';
import 'package:untitled2/pages/login_screen.dart';

class AuthMiddle extends StatelessWidget {
  const AuthMiddle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Doctor_Profile();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
