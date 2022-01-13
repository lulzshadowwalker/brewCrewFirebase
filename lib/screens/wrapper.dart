import 'package:flutter/material.dart';
import 'package:lulz_crew_brew_firebase/models/lulz_user.dart';
import 'package:lulz_crew_brew_firebase/screens/auth/auth.dart';
import 'package:lulz_crew_brew_firebase/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * have to do this in build because we need the context
    // * through <User> we're telling it that we're expecting a User
    final LulzUser? user = Provider.of<LulzUser?>(context);
    print('[Wrapper]: $user');

    // * return either Home or Auth
    return const Auth();
  }
}
