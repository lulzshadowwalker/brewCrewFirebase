import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // * sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user; // * or simply return result.user if it's not gonna be used later
    } catch (e) {
      print(e.toString());
    }
  }

  // * sign in with email and password

  // * register with email and password

  // * sign out
}
