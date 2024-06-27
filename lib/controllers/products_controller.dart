import 'dart:math';

import 'package:dars5/models/product.dart';
import 'package:flutter/material.dart';

class ProductsController with ChangeNotifier {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      type: "Lamp",
      name: "Table Desk Lamp Light",
      price: 140,
      color: Color.fromRGBO(Random().nextInt(222), Random().nextInt(222),
          Random().nextInt(222), 1),
      rating: 5.0,
      reviewsCount: 124,
      descriptionTitle: "Simple & Minimalist Light",
      descriptionContent:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio, eaque rerum! Provident similique accusantium nemo autem",
      imageLink: "https://m.media-amazon.com/images/I/61Ckk6bdzwL.jpg"
    ),
  ];

  List<Product> get list {
    return [..._list];
  }
}
