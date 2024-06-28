import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:online_shop_animation/views/screens/product_info.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final int index;
  const ProductItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
              value: product,
              child: ProductInfo(index: index),
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const Gap(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${product.price}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  CupertinoIcons.heart_circle_fill,
                                  color: Color(0xffCCC5AD),
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 60,
            right: 10,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[700],
                  size: 17,
                ),
                Text(
                  "(${product.rating.toString()})",
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: -10,
            right: 40,
            top: 0,
            child: Image.asset(
              "assets/images/${product.firstColorImage}.png",
              height: 130,
              width: 130,
            ),
          ),
        ],
      ),
    );
  }
}
