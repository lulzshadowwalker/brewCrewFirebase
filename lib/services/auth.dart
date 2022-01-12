import 'package:firebase_auth/firebase_auth.dart';
import 'package:lulz_crew_brew_firebase/models/lulz_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // * create a user obj based on a Firebaseuser
  // ? i think user is null safe. check the documentation of Firebase or the declartaion in the code.
  // ignore: unused_element
  LulzUser? _userFromFirebaseUser(User? user) {
    // ignore: unnecessary_null_comparison
    return user != null ? LulzUser(userID: user.uid) : null;
  }

  // * a stream to listen to auth status of user
  Stream<LulzUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    // * or _auth.onAuthStateChanged.map(FirebaseUser user) => _userFromFirebaseUser(user); but the one above is more effiecnt
  }

  // * sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
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
