import 'package:flutter/material.dart';
import 'package:lulz_crew_brew_firebase/screens/home/home.dart';
import 'package:lulz_crew_brew_firebase/screens/wrapper.dart';
import 'package:lulz_crew_brew_firebase/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // * Basically "providing" the stream to the root widget
    return Provider.value(
      value: AuthService().user,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
