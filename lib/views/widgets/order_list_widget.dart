import 'package:flutter/material.dart';
import 'package:online_shop_animation/controller/order_controller.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:provider/provider.dart';

class OrderListWidget extends StatelessWidget {
  const OrderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context, listen: false);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xffEBEFEF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              height: 120,
              width: 90,
              child: Image.asset(
                "assets/images/${product.firstColorImage}.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Consumer<CartController>(
                      builder: (context, controller, child) {
                    return Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.removeFromCart(product.id);
                          },
                          icon: const Icon(
                            Icons.remove_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          controller.getProductAmount(product.id).toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.addToCart(product);
                          },
                          icon: const Icon(
                            Icons.add_rounded,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 2,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            color: Color(0xff5f8b59),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }),
                  const Text(
                    "Black",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
