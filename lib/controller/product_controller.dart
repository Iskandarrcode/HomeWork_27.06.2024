import 'package:flutter/material.dart';
import 'package:online_shop_animation/models/product_model.dart';

class ProductController extends ChangeNotifier {
  final List<ProductModel> _product = [
    ProductModel(
      id: "9",
      title: "Lamp",
      description: "Table Desk Lamp",
      rating: 5.0,
      price: 142.00,
      isLiked: false,
      firstColorImage: 'lamp',
      productInfo:
          'A stylish table desk lamp perfect for reading and adding a modern touch to your workspace.',
    ),
    ProductModel(
      id: '1',
      title: 'Wireless Headphones',
      description: 'High-quality wireless headphones with noise cancellation.',
      productInfo: 'Bluetooth 5.0, 20-hour battery life',
      rating: 4.5,
      price: 99.99,
      firstColorImage: 'headphones',
      isLiked: true,
    ),
    ProductModel(
      id: '2',
      title: 'Smart Watch',
      description:
          'Water-resistant smart watch with fitness tracking features.',
      productInfo: 'Heart rate monitor, GPS, 7-day battery life',
      rating: 4.2,
      price: 149.99,
      firstColorImage: 'smart_watch',
      isLiked: false,
    ),
    ProductModel(
      id: '3',
      title: 'Gaming Laptop',
      description: 'High-performance laptop for gaming and productivity.',
      productInfo: 'Intel i7, 16GB RAM, 512GB SSD, GTX 1660Ti',
      rating: 4.8,
      price: 1299.99,
      firstColorImage: 'laptop',
      isLiked: true,
    ),
    ProductModel(
      id: '4',
      title: '4K TV',
      description: 'Ultra HD 4K TV with HDR and smart features.',
      productInfo: '55-inch, HDR10, Dolby Vision, Smart TV',
      rating: 4.6,
      price: 499.99,
      firstColorImage: '4k_tv',
      isLiked: false,
    ),
    ProductModel(
      id: '5',
      title: 'Bluetooth Speaker',
      description: 'Portable Bluetooth speaker with excellent sound quality.',
      productInfo: 'Waterproof, 12-hour battery life, built-in mic',
      rating: 4.3,
      price: 59.99,
      firstColorImage: 'speaker',
      isLiked: true,
    ),
    ProductModel(
      id: '6',
      title: 'Smartphone',
      description: 'Latest model smartphone with advanced features.',
      productInfo: '128GB storage, 48MP camera, 5G support',
      rating: 4.7,
      price: 899.99,
      firstColorImage: 'phone',
      isLiked: false,
    ),
    ProductModel(
      id: '7',
      title: 'Tablet',
      description: 'Lightweight tablet with high-resolution display.',
      productInfo: '10-inch display, 64GB storage, Stylus support',
      rating: 4.4,
      price: 299.99,
      firstColorImage: 'tablet',
      isLiked: true,
    ),
    ProductModel(
      id: '8',
      title: 'E-Reader',
      description: 'E-Reader with high-resolution e-ink display.',
      productInfo: '8GB storage, adjustable backlight, Wi-Fi',
      rating: 4.5,
      price: 129.99,
      firstColorImage: 'e_reader',
      isLiked: false,
    ),
  ];

  List get product => [..._product];
}
