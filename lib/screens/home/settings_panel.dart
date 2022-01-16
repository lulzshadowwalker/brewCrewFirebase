import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulz_crew_brew_firebase/models/lulz_user.dart';
import 'package:lulz_crew_brew_firebase/screens/loading_screen.dart';
import 'package:lulz_crew_brew_firebase/services/database_firestore.dart';
import 'package:lulz_crew_brew_firebase/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsPanel extends StatefulWidget {
  const SettingsPanel({Key? key}) : super(key: key);

  @override
  _SettingsPanelState createState() => _SettingsPanelState();
}

class _SettingsPanelState extends State<SettingsPanel> {
  final GlobalKey _formKey = GlobalKey();
  final List<String> _sugarsDropDownList = ['0', '1', '2', '3', '4'];

  String? _name;
  String? _sugars;
  int? _strength;

  @override
  Widget build(BuildContext context) {
    LulzUser user = Provider.of<LulzUser>(context);
    return StreamBuilder<LulzUserData>(
        stream: DatabaseService(userId: user.userId).userData,
        // this snapshot is just flutter's implemntation of the stream it's
        // obviously unrelated to the document snapshot
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            LulzUserData? lulzUserData = snapshot.data;

            return Padding(
              padding: const EdgeInsets.fromLTRB(25, 45, 25, 8),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Update your settings',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.tajawal(
                              fontSize: 26, fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: lulzInputDecoration.copyWith(
                            hintText: _name ?? lulzUserData?.name),
                        validator: (value) =>
                            value!.isEmpty ? 'Enter a value!' : null,
                        onChanged: (value) => setState(() => _name = value),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      DropdownButtonFormField(
                        decoration: lulzInputDecoration.copyWith(
                            hintText:
                                'Number of sugars'), // * i think this is unnecessary here but if i need it's there
                        value: _sugars ?? lulzUserData?.sugars,
                        items: _sugarsDropDownList
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text('$e sugars'),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _sugars = value.toString()),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Slider(
                          label: 'Coffee strength',
                          activeColor:
                              Colors.brown[_strength ?? lulzUserData!.strength],
                          thumbColor:
                              Colors.brown[_strength ?? lulzUserData!.strength],
                          inactiveColor: Colors.brown.shade200,
                          value: (_strength ?? 100).toDouble(),
                          min: 100,
                          max: 900,
                          divisions: 8,
                          onChanged: (val) => setState(
                                () => _strength = val.toInt(),
                              )),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        onPressed: () {},
                        child: Text('save',
                            style: GoogleFonts.tajawal(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                      )
                    ],
                  )),
            );
          } else {
            print('[ERROR] SettingsPanel::StreamBuilder ${snapshot.error}');
            return const SizedBox(height: 450, child: LoadingScreen());
          }
        });
  }
}
