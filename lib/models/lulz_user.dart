import 'package:lulz_crew_brew_firebase/models/brew.dart';

class LulzUser {
  final String userId;

  LulzUser({
    required this.userId,
  });
}

class LulzUserData {
  // i think we can just this entirely instead of LulzUser
  final String? userId;
  final String sugars;
  final String name;
  final int strength;

  LulzUserData(
      {required this.userId,
      required this.sugars,
      required this.name,
      required this.strength});
}
