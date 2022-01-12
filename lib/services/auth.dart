import 'package:firebase_auth/firebase_auth.dart';
import 'package:lulz_crew_brew_firebase/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // * create a user obj based on a Firebaseuser
  // ? i think user is null safe. check the documentation of Firebase or the declartaion in the code.
  // ignore: unused_element
  User? _userFromFirebaseUser(FirebaseUser user) {
    // ignore: unnecessary_null_comparison
    return user != null ? User(userID: user.uid) : null;
  }

  // * sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(
          user); // * or simply return result.user if it's not gonna be used later
    } catch (e) {
      print(e.toString());
    }
  }

  // * sign in with email and password

  // * register with email and password

  // * sign out
}
