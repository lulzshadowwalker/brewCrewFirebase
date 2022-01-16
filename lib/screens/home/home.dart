import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulz_crew_brew_firebase/models/brew.dart';
import 'package:lulz_crew_brew_firebase/screens/home/brew_list.dart';
import 'package:lulz_crew_brew_firebase/screens/home/settings_panel.dart';
import 'package:lulz_crew_brew_firebase/services/auth_service.dart';
import 'package:lulz_crew_brew_firebase/services/database_firestore.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();
  final List<Brew> _initialData = [];
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          context: context,
          builder: (context) => const SettingsPanel());
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService(userId: null).coffee,
      initialData: _initialData,
      child: Scaffold(
          appBar: AppBar(
            title: Text("MANDEM",
                style: GoogleFonts.tajawal(fontWeight: FontWeight.w700)),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 8,
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // todo make the styling more efficient by styling parts of the text
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome back,',
                              style: GoogleFonts.tajawal(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            ),
                            Text(
                              'lulz!',
                              // todo make the name dynamicp
                              style: GoogleFonts.tajawal(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ]),
                    ),
                    FloatingActionButton.extended(
                      label: const Icon(Icons.edit),
                      onPressed: _showSettingsPanel,
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      splashColor: Colors.blue,
                    )
                  ],
                ),

                const BrewList(),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      hoverColor: Colors.yellow.shade700,
                      label: const Icon(Icons.exit_to_app),
                      splashColor: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
