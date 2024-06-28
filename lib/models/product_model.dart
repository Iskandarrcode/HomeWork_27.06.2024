import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  String id;
  String title;
  String description;
  double rating;
  double price;
  String firstColorImage;
  String productInfo;
  bool isLiked;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.productInfo,
    required this.rating,
    required this.price,
    required this.firstColorImage,
    required this.isLiked,
  });
}
