import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulz_crew_brew_firebase/screens/auth/login.dart';
import 'package:lulz_crew_brew_firebase/screens/auth/signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showSignIn = true;

  // * function used to toggle the showSignIn from other widgets
  void toggleView() => setState(() => showSignIn = !showSignIn);

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? Login(toggleView: toggleView)
        : SignUp(toggleView: toggleView);
  }
}
