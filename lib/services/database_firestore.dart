import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String userId;

  DatabaseService({
    required this.userId,
  });

  // * a collection reference
  // * you don't "have" to create the collection before-hand if it doesn't exist it'll be created automatically
  final CollectionReference _brewCollection =
      FirebaseFirestore.instance.collection("brews");

  //** updateUserData is used when 1. registering a user for the 1st time when
  //*they sign up and 2. when they edit their brew preferences later through
  //* the settings */

  //** reason we're here using String for sugars/name and int for strength
  //* is because string is better to be rendered in the design for this specific project
  //* and strength will be used to change the color of the brew and not directly rendered */

  Future updateUserData({String? sugars, String? name, int? strength}) async {
    return await _brewCollection
        .doc(userId)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }
}
