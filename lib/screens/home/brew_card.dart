import 'package:flutter/material.dart';
import 'package:lulz_crew_brew_firebase/models/brew.dart';
import 'package:google_fonts/google_fonts.dart';

class BrewCard extends StatelessWidget {
  const BrewCard({Key? key, required this.brew}) : super(key: key);

  final Brew brew;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
          color: Colors.grey.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 4,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: ListTile(
            title: Text(brew.name,
                style: GoogleFonts.tajawal(fontWeight: FontWeight.w500  )),
            subtitle: Text('takes ${brew.sugars} sugar(s)',
                style: GoogleFonts.tajawal()),
            leading: CircleAvatar(
              backgroundColor: Colors.brown[brew.strength],
            ),
            dense: false,
          )),
    );
  }
}
