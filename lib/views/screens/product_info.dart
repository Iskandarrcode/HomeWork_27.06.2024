import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:online_shop_animation/controller/order_controller.dart';
import 'package:online_shop_animation/controller/product_controller.dart';
import 'package:online_shop_animation/models/product_model.dart';
import 'package:online_shop_animation/views/widgets/custom_dialog.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductInfo extends StatelessWidget {
  final int index;

  ProductInfo({super.key, required this.index});
  bool toggled = false;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context, listen: false);

    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(context, product),
      appBar: _buildAppBar(context),
      body: Consumer<ProductController>(
        builder: (context, controller, child) {
          final product = controller.product[index];
          return ProductDetail(product: product);
        },
      ),
    );
  }

  Widget _buildFloatingActionButton(
      BuildContext context, ProductModel product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Animate()
            .custom(
              duration: 500.milliseconds,
              begin: 10,
              end: 0,
              builder: (_, value, __) => GestureDetector(
                onTap: () {
                  context.read<CartController>().addToCart(
                      context.read<ProductController>().product[index]);
                },
                child: Container(
                  width: 270,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff6D8D54),
                  ),
                  child: Consumer<CartController>(
                    builder: (context, controller, child) {
                      return controller.isInCart(product.id)
                          ? Center(
                              child: Text(
                                controller
                                    .getProductAmount(product.id)
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : const Center(
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                    },
                  ),
                ),
              ),
            )
            .slideY(begin: 0.20, end: 0.0)
            .fadeIn(),
        const Gap(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Animate()
                .custom(
                  duration: 500.milliseconds,
                  begin: 10,
                  end: 0,
                  builder: (_, value, __) => const Icon(
                    CupertinoIcons.heart_circle_fill,
                    color: Color(0xffCCC5AD),
                    size: 55,
                  ),
                )
                .slideY(begin: 0.20, end: 0.0)
                .fadeIn(),
            const Gap(10),
            FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: const Color(0xff6D8D54),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const CustomSheet();
                    });
              },
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.grey,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class ProductDetail extends StatefulWidget {
  final ProductModel product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String? selectedColorImage;

  @override
  void initState() {
    super.initState();
    selectedColorImage = widget.product.firstColorImage;
  }

  void selectColor(String colorImage) {
    setState(() {
      selectedColorImage = colorImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(
            product: widget.product,
            selectedColorImage: selectedColorImage,
            onSelectColor: selectColor,
          ),
          const Gap(10),
          Animate()
              .custom(
                duration: 500.milliseconds,
                begin: 10,
                end: 0,
                builder: (_, value, __) => Column(
                  children: [
                    _buildRatingAndReviews(),
                    _buildProductDescription(),
                    _buildProductInfo(),
                  ],
                ),
              )
              .slideY(begin: 0.20, end: 0.0)
              .fadeIn(),
        ],
      ),
    );
  }

  Widget _buildRatingAndReviews() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              for (var i = 0; i < 5; i++)
                const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "${widget.product.rating}",
                  style: const TextStyle(color: Colors.amber, fontSize: 20),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Text(
                  "124 reviews",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDescription() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        widget.product.description,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        widget.product.productInfo,
        style: const TextStyle(fontSize: 15, color: Colors.grey),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final ProductModel product;
  final String? selectedColorImage;
  final Function(String) onSelectColor;

  const ProductImage({
    super.key,
    required this.product,
    required this.selectedColorImage,
    required this.onSelectColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height / 2.5,
      child: Stack(
        children: [
          Animate()
              .custom(
                duration: 500.milliseconds,
                begin: 10,
                end: 0,
                builder: (_, value, __) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    "assets/images/$selectedColorImage.png",
                    key: ValueKey<String>(selectedColorImage!),
                    height: size.height / 2.5,
                    width: size.width / 1.5,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .slideX(begin: -0.10, end: 0.0)
              .fadeIn(),
          Positioned(
            right: 0,
            left: 150,
            child: Animate()
                .custom(
                  duration: 500.milliseconds,
                  begin: 10,
                  end: 0,
                  builder: (_, value, __) => Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(color: Color(0xffCCC5AD)),
                        ),
                        Text(
                          product.description,
                          maxLines: 2,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(40),
                        const Text(
                          "Price",
                          style: TextStyle(color: Color(0xffCCC5AD)),
                        ),
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(10),
                        ColorOptions(
                          onSelectColor: onSelectColor,
                        ),
                      ],
                    ),
                  ),
                )
                .slideY(begin: 0.090, end: 0.0)
                .fadeIn(),
          ),
        ],
      ),
    );
  }
}

class ColorOptions extends StatelessWidget {
  final Function(String) onSelectColor;

  const ColorOptions({
    super.key,
    required this.onSelectColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "Choose Colors",
          style: TextStyle(color: Color(0xffCCC5AD)),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ColorOption(
              color: Colors.red[200],
              colorImage: 'lamp_red',
              onSelectColor: onSelectColor,
            ),
            const Gap(10),
            ColorOption(
              color: Colors.blue[400],
              colorImage: 'lamp_blue',
              onSelectColor: onSelectColor,
            ),
            const Gap(10),
            ColorOption(
              color: Colors.black,
              colorImage: 'lamp',
              onSelectColor: onSelectColor,
            ),
          ],
        ),
      ],
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color? color;
  final String colorImage;
  final Function(String) onSelectColor;

  const ColorOption({
    super.key,
    required this.color,
    required this.colorImage,
    required this.onSelectColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelectColor(colorImage),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
      ),
    );
  }
}
