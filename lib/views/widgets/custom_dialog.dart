import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_animation/controller/order_controller.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:online_shop_animation/views/screens/payment_screen.dart';
import 'package:online_shop_animation/views/widgets/order_list_widget.dart';
import 'package:provider/provider.dart';

class CustomSheet extends StatelessWidget {
  const CustomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
      child: cartController.cart.products.isEmpty
          ? const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text("Savatcha bo'sh, mahsulot qo'shing"),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 4,
                    width: 40,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "My Cart",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Card(
                      elevation: 0,
                      color: const Color(0xff5f8b59),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: 6),
                        child: Text(
                          "${cartController.cart.products.length} items",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 310,
                  child: ListView.builder(
                    // itemCount: cartController.cart.products.length,
                    itemCount:
                        context.watch<CartController>().cart.products.length,
                    itemBuilder: (ctx, index) {
                      final product = cartController.cart.products.values
                          .toList()[index]['product'];
                      return ChangeNotifierProvider<ProductModel>.value(
                        value: product,
                        builder: (context, child) {
                          return const OrderListWidget();
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "Total:  ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "\$${cartController.cart.totalPrice.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Color(0xff5f8b59),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xff5f8b59),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const PaymentScreen(),
                    ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Buy now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
