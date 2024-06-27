import 'package:flutter/material.dart';

class Product {
  final String id;
  final String type;
  final String name;
  final double price;
  final Color color;
  final double rating;
  final int reviewsCount;
  final String descriptionTitle;
  final String descriptionContent;
  final String imageLink;
  bool isFavorite;

  Product({
    required this.id,
    required this.type,
    required this.name,
    required this.price,
    required this.color,
    required this.rating,
    required this.reviewsCount,
    required this.descriptionTitle,
    required this.descriptionContent,
    required this.imageLink,
    this.isFavorite = false,
  });
}
