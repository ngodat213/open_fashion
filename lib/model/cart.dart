import 'package:flutter/material.dart';

class Cart {
  late final int? id;
  final String? productId;
  final String? productName;
  final String? productTitle;
  final double? productPrice;
  final int? size;
  final int? quantity;
  final Color? color;

  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productTitle,
    required this.productPrice,
    required this.quantity,
    required this.size,
    required this.color,
  });

  Cart.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        productId = data['productId'],
        productName = data['productName'],
        productTitle = data['productTitle'],
        productPrice = data['productPrice'],
        quantity = data['quantity'],
        size = data['size'],
        color = data['color'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'productTitle': productTitle,
      'productPrice': productPrice,
      'size': size,
      'color': color
    };
  }
}
