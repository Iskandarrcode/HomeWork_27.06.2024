import 'package:dars5/models/product.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  Product product;
  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage(),))
          },
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          "5",
                          style: TextStyle(color: Colors.yellow),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      product.name,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      product.type,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price.toInt().toString()}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.teal,
                              fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {
                            product.isFavorite = !product.isFavorite;
                          },
                          icon: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: product.isFavorite
                                  ? Colors.green
                                  : Colors.teal[100],
                            ),
                            child: const Icon(
                              Icons.favorite_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: -40,
            child: Image.network(
              product.imageLink,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ))
      ],
    );
  }
}
