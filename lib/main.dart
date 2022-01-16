import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lulz_crew_brew_firebase/screens/wrapper.dart';
import 'package:lulz_crew_brew_firebase/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // * Basically "providing" the stream to the root widget
    // ? why doesnt this work: return StreamProvider<LulzUser?>.value(
    // ? BECAUSE IT WASN'T IMPORTED IDIOT
    return StreamProvider.value(
      value: AuthService().user,
      initialData: null,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
