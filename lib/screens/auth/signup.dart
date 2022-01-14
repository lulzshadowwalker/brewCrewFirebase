import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulz_crew_brew_firebase/services/auth_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({
    Key? key,
    required this.toggleView,
  }) : super(key: key);

  final Function toggleView;

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();

  // * This helps us validate the form and keep track of it's state
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _error = '';

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
                icon: const Icon(Icons.vpn_key_rounded),
                label: const Text(""))
          ],
        ),
        body: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Enter an email' : null,
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
                    validator: (value) => value!.length < 6
                        ? 'Password must be 6+ characters'
                        : null,
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
                        if (_formKey.currentState!.validate()) {
                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  email: _email, password: _password);

                          if (result == null) {
                            setState(() {
                              _error = 'provide a valid email';
                            });
                          }
                        }
                      },
                      child: Text('Sign Up',
                          style: GoogleFonts.tajawal(color: Colors.white)),
                      style: ElevatedButton.styleFrom(primary: Colors.black)),
                  SizedBox(height: 12),
                  Text(
                    _error,
                    style: GoogleFonts.tajawal(color: Colors.red),
                  )
                ],
              ),
            )));
  }
}
