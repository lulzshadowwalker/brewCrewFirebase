import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulz_crew_brew_firebase/models/brew.dart';
import 'package:provider/provider.dart';

import 'brew_card.dart';

class BrewList extends StatelessWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);

    brews.forEach((brew) {
      brew.printBrewDetails();
    });

    return Container(
        alignment: Alignment.topLeft,
        // margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                // todo make the height of the listview dynamic
                height: 385,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: brews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BrewCard(brew: brews[index]);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
