import 'package:firebase_auth/firebase_auth.dart';
import 'package:lulz_crew_brew_firebase/models/lulz_user.dart';

// * all the auth "logic" is handeled in this class
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
      print('[ERROR] authService::signInAnon >> ${e.toString()}');
      return null;
    }
  }

  // * sign in with email and password

  // * register with email and password
  Future registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print('[ERROR] registerEmailPwd: ${e.toString()}');
      return null;
    }
  }

  // * sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('[ERROR] authService::signOut >> ${e.toString()}');
      return null;
    }
  }
}
