import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulz_crew_brew_firebase/services/auth_service.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MANDEM",
              style: GoogleFonts.tajawal(fontWeight: FontWeight.w700)),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 8,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () async {
              await _auth.signOut();
            },
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            hoverColor: Colors.yellow.shade700,
            child: const Icon(Icons.exit_to_app),
            splashColor: Colors.red,
          ),
        ));
  }
}
