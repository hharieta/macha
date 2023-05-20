import 'package:macha/data/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:macha/screens/product_detail_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:flutter/rendering.dart';

import '../constants/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final _control = PageController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            appBarr(),
            searchBox(),
            banner(),
            mainCards(),
          ],
        ),
      ),
    );
  }

  SliverPadding mainCards() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ProductDetailScreen(index: index),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Image.asset(
                        'assets/images/${index + 1}.png',
                        height: 200,
                        width: 190,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 190,
                      left: 20,
                      child: Text(
                        banners()[index].name!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      right: 0,
                      left: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${banners()[index].price!}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: second.withOpacity(0.7),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: second.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: 4,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 270,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      ),
    );
  }

  SliverToBoxAdapter banner() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: PageView(
              // controller: _control,
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: second,
                    ),
                    child: bannerBuild(0),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: second,
                    ),
                    child: bannerBuild(1),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: second,
                    ),
                    child: bannerBuild(2),
                  ),
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _control,
            count: 3,
            effect: const WormEffect(
              dotHeight: 11,
              dotWidth: 11,
              dotColor: Color(0xffe8c571),
              activeDotColor: Color(0xfff35383),
            ),
          ),
        ],
      ),
    );
  }

  Row bannerBuild(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'New Relase',
              style: TextStyle(
                color: backgroundColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              banners()[count].name!,
              style: TextStyle(
                color: backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Ajua!',
              style: TextStyle(
                color: backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 90,
              height: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mains,
              ),
              child: Text(
                'Buy Now',
                style: TextStyle(
                  color: backgroundColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        RotationTransition(
          turns: const AlwaysStoppedAnimation(0 / 360),
          child: Image.asset(
            'assets/images/${banners()[count].image}',
            height: 180,
            width: 180,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }

  SliverToBoxAdapter searchBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.search, color: Color(0xff999999)),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search Suase',
                      style: TextStyle(
                          color: Color(0xffbcbcbc),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mains,
                ),
                child: const Icon(
                  Icons.filter_alt,
                  color: Color(0xffffffff),
                  size: 27,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SliverToBoxAdapter appBarr() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: const Icon(Icons.list),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/images/logo.jpeg"),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
