import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulz_crew_brew_firebase/screens/auth/login.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Login(),
    );
  }
}
