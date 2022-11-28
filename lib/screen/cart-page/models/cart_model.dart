final String tableCart = 'cart';

class Cart {
  static final List<String> values = [id, title, price, image, quantity];

  static const String id = 'id';
  static const String title = 'title';
  static const String price = 'price';
  static const String image = 'image';
  static const String quantity = 'quantity';
}

class CartModel {
  final int? id;
  final String? title;
  final String? price;
  final String? image;
  final String? quantity;

  CartModel({
    this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map[Cart.id] as int?,
      title: map[Cart.title] as String?,
      price: map[Cart.price] as String?,
      image: map[Cart.image] as String?,
      quantity: map[Cart.quantity] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      Cart.id: id,
      Cart.title: title,
      Cart.price: price,
      Cart.image: image,
      Cart.quantity: quantity,
    };
  }
}