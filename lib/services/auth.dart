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

  // * a stream to listen to auth status of user
  Stream<User?> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
    // * or _auth.onAuthStateChanged.map(Firebase user) => _userFromFirebaseUser(user); but the one above is more effiecnt
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
