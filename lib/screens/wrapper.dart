import 'package:flutter/material.dart';
import 'package:lulz_crew_brew_firebase/screens/auth/auth.dart';
import 'package:lulz_crew_brew_firebase/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * return either Home or Auth
    return const Auth();
  }
}
