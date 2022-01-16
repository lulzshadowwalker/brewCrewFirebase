import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lulz_crew_brew_firebase/models/brew.dart';
import 'package:lulz_crew_brew_firebase/models/lulz_user.dart';

class DatabaseService {
  final String? userId;

  DatabaseService({
    required this.userId,
  });

  //  a collection reference
  //  you don't "have" to create the collection before-hand if it doesn't exist it'll be created automatically
  final CollectionReference _brewCollection =
      FirebaseFirestore.instance.collection("brews");

  // ** updateUserData is used when 1. registering a user for the 1st time when
  // * they sign up and 2. when they edit their brew preferences later through
  // * the settings */

  // ** reason we're here using String for sugars/name and int for strength
  // * is because string is better to be rendered in the design for this specific project
  // * and strength will be used to change the color of the brew and not directly rendered */

  Future updateUserData({String? sugars, String? name, int? strength}) async {
    // in case the constructor passed in a null value (which might be intentional in some cases
    // * e.g. when setting the value for the StreamProvider), this null check here ensures that
    // * we don't use those methods. there might be a better handling for the case but atm this is
    // * what i'm gonna do * /
    if (userId == null) return;

    return await _brewCollection
        .doc(userId)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

// user data from snapshots
  LulzUserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return LulzUserData(
        userId: userId,
        name: snapshot['name'],
        sugars: snapshot['sugars'],
        strength: snapshot['strength']);
  }

// get user doc stream
  Stream<LulzUserData> get userData {
    return _brewCollection.doc(userId).snapshots().map(_userDataFromSnapshot);
  }

  // Brew list from a snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => Brew(
            name: doc['name'] ?? '',
            sugars: doc['sugars'] ?? '0',
            strength: doc['strength'] ?? 0))
        .toList();
  }

  // LulzUserData from a snapshot
  LulzUserData lulzUserDataFromSnapshot(DocumentSnapshot doc) {
    return LulzUserData(
        userId: userId,
        sugars: doc['sugars'],
        name: doc['name'],
        strength: doc['stregth']);
  }


  // get brew stream
  Stream<List<Brew>> get coffee {
    return _brewCollection.snapshots().map(_brewListFromSnapshot);
    // * .map((snapshot) => _brewListFromSnapshot(snapshot)); = .map(_brewListFromSnapshot); I love dart 🤤
  }
}
