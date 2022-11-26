final String tableWishlist = 'wishlist';

class Wishlist {
  static final List<String> values = [id, title, price, image];

  static const String id = 'id';
  static const String title = 'title';
  static const String price = 'price';
  static const String image = 'image';
}

class WishlistModel {
  final int? id;
  final String? title;
  final String? price;
  final String? image;

WishlistModel({
    this.id,
    required this.title,
    required this.price,
    required this.image,
  });

factory WishlistModel.fromMap(Map<String, dynamic> map) {
    return WishlistModel(
      id: map[Wishlist.id] as int?,
      title: map[Wishlist.title] as String?,
      price: map[Wishlist.price] as String?,
      image: map[Wishlist.image] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      Wishlist.id: id,
      Wishlist.title: title,
      Wishlist.price: price,
      Wishlist.image: image,
    };
  }
}