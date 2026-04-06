class AppUser {
  final String uid;
  final String email;
  final String displayName;
  final String? avatarUrl;
  final String bio;
  final String campusId;
  final String campusName;
  final int? graduationYear;
  final int listingCount;
  final double rating;
  final int ratingCount;
  final List<String> badges;
  final int itemsSold;
  final int itemsDonated;
  final int itemsBought;
  final double moneySaved;
  final double co2Diverted;

  const AppUser({
    required this.uid,
    required this.email,
    required this.displayName,
    this.avatarUrl,
    this.bio = '',
    required this.campusId,
    required this.campusName,
    this.graduationYear,
    this.listingCount = 0,
    this.rating = 0,
    this.ratingCount = 0,
    this.badges = const [],
    this.itemsSold = 0,
    this.itemsDonated = 0,
    this.itemsBought = 0,
    this.moneySaved = 0,
    this.co2Diverted = 0,
  });
}
