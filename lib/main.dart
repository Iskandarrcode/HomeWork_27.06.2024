import 'package:flutter/material.dart';
import 'package:online_shop_animation/controller/order_controller.dart';
import 'package:online_shop_animation/controller/product_controller.dart';
import 'package:online_shop_animation/views/screens/home_page.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) {
          return ProductController();
        }),
        ChangeNotifierProvider(create: (ctx) {
          return CartController();
        }),
      ],
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}
