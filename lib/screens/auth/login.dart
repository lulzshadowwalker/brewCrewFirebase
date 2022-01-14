import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulz_crew_brew_firebase/screens/loading_screen.dart';

import 'package:lulz_crew_brew_firebase/services/auth_service.dart';
import 'package:lulz_crew_brew_firebase/shared/constants.dart';

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

  // * This helps us validate the form and keep track of it's state
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _error = '';

  // * used to determin whether the loading screen should be displayed or not
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
            appBar: AppBar(
              title: Text('Sign in', style: GoogleFonts.tajawal()),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 100,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Enter an email' : null,
                        decoration:
                            lulzInputDecoration.copyWith(hintText: "E-mail"),
                        onChanged: (value) {
                          setState(() => _email = value);
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        validator: (value) => value!.length < 6
                            ? 'Password must be 6+ characters'
                            : null,
                        decoration:
                            lulzInputDecoration.copyWith(hintText: "Password"),
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
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              dynamic result =
                                  await _auth.signInWithEmailAndPassword(
                                      email: _email, password: _password);

                              // * we dont need to reset the isLoading here because
                              // ** because it automatically switches to the home
                              // ** screen if the login was succesful

                              if (result == null) {
                                setState(() {
                                  isLoading = false;
                                  _error =
                                      'Login failed\nCheck your credentials or sign up if you are a new user!';
                                });
                              }
                            }
                          },
                          child: Text('Sign in',
                              style: GoogleFonts.tajawal(color: Colors.white)),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black)),
                      SizedBox(height: 12),
                      Text(
                        _error,
                        style: GoogleFonts.tajawal(color: Colors.red),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 30.0),
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              widget.toggleView();
                            },
                            label: Row(
                              children: <Widget>[
                                Text(
                                  'Sign up ?',
                                  style: GoogleFonts.tajawal(),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(Icons.person_add)
                              ],
                            ),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            splashColor: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                )));
  }
}
