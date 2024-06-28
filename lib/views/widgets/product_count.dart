import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/product_controller.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, productController, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Have ${productController.product.length} products',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 90,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sort by',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
