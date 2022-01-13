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
      actions: <Widget>[
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                elevation:
                    0.0), // * elevation set to 0.0 because if we change the color to other than black in the future
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.exit_to_app),
            label: const Text(""))
      ],
    ));
  }
}
