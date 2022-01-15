import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lulz_crew_brew_firebase/shared/constants.dart';

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
                decoration:
                    lulzInputDecoration.copyWith(hintText: 'Display name'),
                validator: (value) => value!.isEmpty ? 'Enter a value!' : null,
                onChanged: (value) => setState(() => _name = value),
              ),
              const SizedBox(
                height: 20.0,
              ),
              DropdownButtonFormField(
                decoration: lulzInputDecoration.copyWith(
                    hintText:
                        'Number of sugars'), // * i think this is unnecessary here but if i need it's there
                value: _sugars ?? '0',
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
                  activeColor: Colors.brown[_strength ?? 100],
                  thumbColor: Colors.brown[_strength ?? 100],
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
  }
}
