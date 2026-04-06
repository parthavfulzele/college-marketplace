class Listing {
  final String id;
  final String sellerId;
  final String sellerName;
  final String? sellerAvatarUrl;
  final double sellerRating;
  final String title;
  final String description;
  final double price;
  final bool isDonate;
  final String category;
  final String condition;
  final List<String> images;
  final DateTime createdAt;

  const Listing({
    required this.id,
    required this.sellerId,
    required this.sellerName,
    this.sellerAvatarUrl,
    this.sellerRating = 0,
    required this.title,
    required this.description,
    required this.price,
    this.isDonate = false,
    required this.category,
    required this.condition,
    required this.images,
    required this.createdAt,
  });

  String get formattedPrice => isDonate ? 'FREE' : '\$${price.toStringAsFixed(price % 1 == 0 ? 0 : 2)}';
}

class WishlistItem {
  final String id;
  final String query;
  final String? category;
  final double? maxPrice;

  const WishlistItem({
    required this.id,
    required this.query,
    this.category,
    this.maxPrice,
  });
}
