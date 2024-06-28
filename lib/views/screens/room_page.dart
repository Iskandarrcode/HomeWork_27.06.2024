import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:online_shop_animation/views/widgets/product_count.dart';
import 'package:online_shop_animation/views/widgets/product_grid.dart';

class RoomPage extends StatelessWidget {
  final String image;
  final String title;

  const RoomPage({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            toolbarHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Animate()
                      .custom(
                        duration: 500.milliseconds,
                        begin: 10,
                        end: 0,
                        builder: (_, value, __) => Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Image.network(
                            image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                      .slideY(begin: -0.10, end: 0.0),
                  Animate()
                      .custom(
                        duration: 500.milliseconds,
                        begin: 10,
                        end: 0,
                        builder: (_, value, __) => Container(
                          width: MediaQuery.of(context).size.width,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            color: Colors.black26,
                          ),
                        ),
                      )
                      .slideY(begin: -0.10, end: 0.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: const Color(0xff6D8D54),
            onPressed: () {},
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          body: Column(
            children: [
              Animate()
                  .custom(
                    duration: 1.seconds,
                    begin: 10,
                    end: 0,
                    builder: (_, value, __) => const SizedBox(
                      height: 80,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: ProductCount(),
                      ),
                    ),
                  )
                  .fadeIn(),
              Expanded(
                child: SingleChildScrollView(
                  child: Animate()
                      .custom(
                        duration: 500.milliseconds,
                        begin: 10,
                        end: 0,
                        builder: (_, value, __) => const Column(
                          children: [
                            ProductGrid(),
                          ],
                        ),
                      )
                      .slideY(begin: 0.030, end: 0.0)
                      .fadeIn(),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          left: 5,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
