import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFav;
  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.imageUrl,
      this.isFav = false,
      @required this.price});

  void toggleFavStatus() {
    isFav = !isFav;
    notifyListeners();
  }
}
