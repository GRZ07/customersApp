class User {
  final int userId;
  String username;
  final String name;
  final String phoneNumber;
  final String token;
  String? imageUrl;
  String preferredCurrency;
  int cartItemsCount;

  User({
    required this.userId,
    required this.username,
    required this.name,
    required this.token,
    required this.phoneNumber,
    required this.imageUrl,
    required this.preferredCurrency,
    required this.cartItemsCount,
  });
}
