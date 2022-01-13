import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lulz_crew_brew_firebase/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
    required this.toggleView,
  }) : super(key: key);

  final Function toggleView;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('login anon', style: GoogleFonts.tajawal()),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: <Widget>[
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation:
                        0.0), // * elevation set to 0.0 because if we change the color to other than black in the future
                onPressed: () {
                  widget.toggleView();
                },
                icon: const Icon(Icons.person_add),
                label: const Text(""))
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onChanged: (value) {
                      setState(() => _email = value);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50))),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() => _password = value);
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        print('[login] email: $_email pwd: $_password');
                      },
                      child: Text('Login',
                          style: GoogleFonts.tajawal(color: Colors.white)),
                      style: ElevatedButton.styleFrom(primary: Colors.black))
                ],
              ),
            )));
  }
}
