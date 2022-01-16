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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _sugarsDropDownList = ['0', '1', '2', '3', '4'];

  String? _name;
  String? _sugars;
  int? _strength;

  @override
  Widget build(BuildContext context) {
    LulzUser user = Provider.of<LulzUser>(context);

    bool isLoading = false;

    return StreamBuilder<LulzUserData>(
        stream: DatabaseService(userId: user.userID).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('StreamBuilder: all good holy shit');
            LulzUserData? userData = snapshot.data;
            return isLoading
                ? const LoadingScreen()
                : Padding(
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
                                    fontSize: 26,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              decoration: lulzInputDecoration.copyWith(
                                  hintText: _name ?? userData?.name),
                              // validator: (value) =>
                              //     value!.isEmpty ? 'Enter a value!' : null,
                              onChanged: (value) =>
                                  setState(() => _name = value),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            DropdownButtonFormField(
                              decoration: lulzInputDecoration.copyWith(
                                  hintText: _sugars == null
                                      ? 'c sugars'
                                      : '$_sugars sugars'),
                              value: _sugars ?? '${userData?.sugars}',
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
                                activeColor: Colors
                                    .brown[_strength ?? userData!.strength],
                                thumbColor: Colors
                                    .brown[_strength ?? userData!.strength],
                                inactiveColor: Colors.brown.shade200,
                                value: (_strength ?? userData!.strength)
                                    .toDouble(),
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
                              onPressed: () async {
                                // I dont really check for anything for validation so it's always valid
                                // but in-case i want to in the future, it's there
                                if (_formKey.currentState!.validate()) {
                                  setState(() => isLoading = true);
                                  await DatabaseService(userId: user.userID)
                                      .updateUserData(
                                    name: _name ?? userData?.name,
                                    sugars: _sugars ?? userData?.sugars,
                                    strength: _strength ?? userData?.strength,
                                  );
                                  Navigator.pop(context);
                                }
                              },
                              child: Text('save',
                                  style:
                                      GoogleFonts.tajawal(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                              ),
                            )
                          ],
                        )),
                  );
          } else {
            return LoadingScreen();
          }
        });
  }
}
