import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulz_crew_brew_firebase/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login anonymously'),
          centerTitle: true,
        ),
        body: Center(
          child: SizedBox(
              // padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
              height: 30,
              width: 70,
              child: ElevatedButton(
                  onPressed: () async {
                    // * dynamic because it returns either result or null
                    dynamic result = await _auth.signInAnon();
                    if (result == null)
                      print("error logging in");
                    else
                      print("login succesful");
                    print(result.userID);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 300,
                      child: Text('Login', style: GoogleFonts.tajawal())))),
        ));
  }
}
