import 'dart:ui';

class Product {
  int? id;
  List<String>? imageSlider;
  List<Color>? productColor;
  String? thumbUrl;
  String? name;
  String? title;
  double? price;
  double? rating;
  List<String>? size;
  List<String>? type;
  int? idBrand;

  Product({
    this.id,
    this.imageSlider,
    this.productColor,
    this.thumbUrl,
    this.name,
    this.title,
    this.price,
    this.rating,
    this.size,
    this.type,
    this.idBrand,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageSlider = json['imageSlider'].cast<String>();
    productColor = (json['productColor'] as List)
        .map((colorHex) => Color(int.parse(colorHex)))
        .toList();
    thumbUrl = json['thumbUrl'];
    name = json['name'];
    title = json['title'];
    price = json['price'].toDouble();
    rating = json['rating'].toDouble();
    size = json['size'].cast<String>();
    type = json['type'].cast<String>();
    idBrand = json['idBrand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageSlider'] = this.imageSlider;
    data['productColor'] = this
        .productColor
        ?.map((color) => color.toHex())
        .toList(); // Convert colors to hexadecimal strings
    data['thumbUrl'] = this.thumbUrl;
    data['name'] = this.name;
    data['title'] = this.title;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['size'] = this.size;
    data['type'] = this.type;
    data['idBrand'] = this.idBrand;
    return data;
  }
}

extension ColorExtension on Color {
  String toHex() {
    return '#${value.toRadixString(16).padLeft(8, '0')}';
  }
}
