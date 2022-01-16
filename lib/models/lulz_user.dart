class LulzUser {
  late final String? userID;

  LulzUser({
    required this.userID,
  });
}

class LulzUserData {
  final String? userId;
  final String name;
  final String sugars;
  final int strength;

  LulzUserData(
      {required this.userId,
      required this.name,
      required this.sugars,
      required this.strength});
}
