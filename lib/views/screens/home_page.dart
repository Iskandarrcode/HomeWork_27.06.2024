import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:online_shop_animation/views/screens/room_page.dart';
import 'package:online_shop_animation/views/widgets/custom_dialog.dart';
import 'package:online_shop_animation/views/widgets/product_count.dart';
import 'package:online_shop_animation/views/widgets/product_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  final List<Map<String, String>> _pageViewList = [
    {
      "title": "Living Room",
      "image":
          "https://i.pinimg.com/originals/75/99/bf/7599bfe7f7e546ff89028b01d9eec7b8.jpg"
    },
    {
      "title": "Wall Decoration",
      "image":
          "https://i.pinimg.com/originals/b5/8a/bc/b58abcb2e21147a7a82cad5e6dcd5051.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(CupertinoIcons.bell),
          Gap(10),
          Icon(CupertinoIcons.search),
          Gap(10),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/person.png"),
          ),
          Gap(10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCarousel(),
                const Gap(20),
                _buildCategoryBar(),
                const Gap(10),
                const ProductCount(),
                const Gap(10),
                const ProductGrid(),
              ],
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return SizedBox(
      height: 175,
      child: CarouselSlider.builder(
        itemCount: _pageViewList.length,
        itemBuilder: (context, index, realIdx) {
          final item = _pageViewList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomPage(
                    image: item['image']!,
                    title: item['title']!,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    item['image']!,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      item['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: .8,
          enableInfiniteScroll: true,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            _currentIndexNotifier.value = index;
          },
        ),
      ),
    );
  }

  Widget _buildCategoryBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryBarItem(title: 'Popular', isActive: true),
          CategoryBarItem(title: 'New'),
          CategoryBarItem(title: 'Best Selling'),
          CategoryBarItem(title: 'Featured'),
        ],
      ),
    );
  }
}

class CategoryBarItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const CategoryBarItem({
    super.key,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        color: isActive ? Colors.green : Colors.grey,
      ),
    );
  }
}
