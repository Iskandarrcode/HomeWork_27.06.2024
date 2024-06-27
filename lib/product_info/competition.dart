import 'package:dars5/product_info/widgets/choice.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Maxsulotlar extends StatefulWidget {
  const Maxsulotlar({super.key});

  @override
  State<Maxsulotlar> createState() => _MaxsulotlarState();
}

class _MaxsulotlarState extends State<Maxsulotlar> {
  bool isTap = false;
  bool isTap2 = false;
  bool isTap3 = true;
  int indexImage = 0;
  bool favoritButton = false;
  List images = [
    "https://lustrabra.ru/upload/iblock/e13/e13392de41afc2de37e80bdc903042db.jpeg",
    "https://dekov.ru/res/img/product/globo/22554/1.jpg",
    "https://lucisso.ru/upload/iblock/612/6127bae8c083f18acc4bd1099400e2f7.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(192, 64, 119, 66),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Color.fromARGB(192, 64, 119, 66),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 200,
                  height: 250,
                  child: Image.network("${images[indexImage]}"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Lamp",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Table Desk",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Lamp Light",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Price",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "\$140.00",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green.shade500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Choose Colors",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        ZoomTapAnimation(
                          onTap: () {
                            isTap = true;
                            isTap2 = false;
                            isTap3 = false;
                            indexImage = 2;
                            setState(() {});
                          },
                          child: ChoiceContainer(
                            isTap: isTap,
                            colors: Colors.amber.shade700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            isTap2 = true;
                            isTap = false;
                            isTap3 = false;
                            setState(() {});
                            indexImage = 1;
                          },
                          child: ChoiceContainer(
                            isTap: isTap2,
                            colors: Colors.cyanAccent.shade700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            isTap3 = true;
                            isTap = false;
                            isTap2 = false;
                            indexImage = 0;
                            setState(() {});
                          },
                          child: ChoiceContainer(
                            isTap: isTap3,
                            colors: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Text(
              "Simple & Minimalist Light",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: favoritButton
                        ? Colors.green.shade300
                        : const Color.fromARGB(213, 200, 230, 201),
                  ),
                  child: IconButton(
                    onPressed: () {
                      favoritButton = !favoritButton;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: favoritButton ? Colors.red.shade400 : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                  onTap: () {},
                  child: Container(
                    width: 220,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.green.shade300,
                    ),
                    child: const Center(
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {},
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green.shade300,
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
