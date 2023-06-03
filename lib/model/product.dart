import 'dart:ui';

class Product {
  final List<String> imageSlider;
  final List<Color> productColor;
  final String thumbUrl;
  final String name;
  final String title;
  final double price;
  final double ratting;
  final List<String> size;

  Product({
    required this.imageSlider,
    required this.productColor,
    required this.thumbUrl,
    required this.name,
    required this.title,
    required this.price,
    required this.ratting,
    required this.size,
  });
}
