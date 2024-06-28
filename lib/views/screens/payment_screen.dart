import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_animation/controller/order_controller.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:online_shop_animation/views/screens/home_page.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            size: 30,
            color: Colors.grey,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.green.shade300,
              ),
              child: Center(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Payment Successful!',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Orders will arrive in 3 days',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            height: 300,
            width: 320,
            child: GridView.builder(
              itemCount: cartController.cart.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 120,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                final product = cartController.cart.products.values
                    .toList()[index]['product'];
                return ChangeNotifierProvider<ProductModel>.value(
                  value: product,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade200,
                        ),
                        child: Image.asset(
                            "assets/images/${product.firstColorImage}.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5),
                        child: Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 230,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                shadowColor: Colors.green.shade400,
                backgroundColor: Colors.green.shade400,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: const Text(
                "BACK TO HOME",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
