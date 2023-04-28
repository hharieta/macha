import 'package:flutter/material.dart';
import 'package:macha/constants/colors.dart';
import 'package:macha/data/banner_model.dart';
import 'package:macha/screens/home.dart';

class ProductDetailScreen extends StatefulWidget {
  int index;
  ProductDetailScreen({super.key, required this.index});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          appbar(context),
        ],
      )),
    );
  }

  SliverAppBar appbar(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/${banners()[widget.index].image!}',
          fit: BoxFit.cover,
        ),
      ),
      expandedHeight: 450,
      backgroundColor: backgroundColor,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          height: 20,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70),
              topRight: Radius.circular(70),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              Container(
                height: 4,
                width: 100,
                decoration: BoxDecoration(
                  color: mains,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CircleAvatar(
            backgroundColor: const Color.fromRGBO(250, 250, 250, 0.6),
            radius: 18,
            child: Icon(
              Icons.favorite_border,
              color: second,
              size: 25,
            ),
          ),
        )
      ],
      title: GestureDetector(
        onTap: () {
          Navigator.of(context).pop(
            MaterialPageRoute(
              builder: (BuildContext context) => Home(),
            ),
          );
        },
        child: CircleAvatar(
          backgroundColor: const Color.fromRGBO(250, 250, 250, 0.6),
          radius: 18,
          child: Icon(
            Icons.arrow_back,
            color: second,
            size: 25,
          ),
        ),
      ),
    );
  }
}
