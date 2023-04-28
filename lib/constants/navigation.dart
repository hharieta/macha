import 'package:macha/constants/colors.dart';
import 'package:macha/screens/home.dart';
import 'package:flutter/material.dart';

class Navi extends StatefulWidget {
  const Navi({super.key});

  @override
  State<Navi> createState() => _NaviState();
}

int index = 0;
List screen = [const Home(), const Home(), const Home(), const Home()];

class _NaviState extends State<Navi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: second,
        child: const Icon(
          Icons.shopping_cart_outlined,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Icon(
                  Icons.home_filled,
                  size: 27,
                  color: index == 0 ? second : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Icon(
                  Icons.category,
                  size: 27,
                  color: index == 1 ? second : Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Icon(
                  Icons.favorite,
                  size: 27,
                  color: index == 2 ? second : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Icon(
                  Icons.person,
                  size: 27,
                  color: index == 3 ? second : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screen[index],
    );
  }
}
