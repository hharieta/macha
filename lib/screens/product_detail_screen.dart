import 'package:flutter/material.dart';
import 'package:macha/constants/colors.dart';
import 'package:macha/constants/navigation.dart';
import 'package:macha/data/banner_model.dart';
import 'package:macha/screens/home.dart';

class ProductDetailScreen extends StatefulWidget {
  int index;
  ProductDetailScreen({super.key, required this.index});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

int indexGetImagesList = 0;
int indexSizeList = 0;

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    List getImages = [
      banners()[widget.index].image!,
      banners()[widget.index].image1!,
      banners()[widget.index].image2!,
      banners()[widget.index].image3!
    ];

    List size = ["CH", "M", "G", "XG"];

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${banners()[index].price!}",
              style: TextStyle(
                color: second,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 190,
              height: 50,
              decoration: BoxDecoration(
                color: second,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      'Agregar a cesta',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            appbar(context, getImages),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      banners()[index].name!,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '4.3',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 0 : 24,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  indexGetImagesList = index;
                                });
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: indexGetImagesList == index
                                        ? second
                                        : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/${getImages[index]}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Seleccionar tamaño',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 35,
                      child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 14,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  indexSizeList = index;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.2,
                                    color: indexSizeList == index
                                        ? second
                                        : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '${size[index]}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Detalles',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Personalizador de salsa macha bajo demanda con toppings predefinidos:\nLa \"Salsa Macha\" con el sabor cultural de cada región del país qué complace a todos los paladares de nuestros consumidores La \"Salsa Macha\" con el sabor cultural de cada región del país qué complace a todos los paladares de nuestros consumidores La \"Salsa Macha\" con el sabor cultural de cada región del país qué complace a todos los paladares de nuestros consumidores La \"Salsa Macha\" con el sabor cultural de cada región del país qué complace a todos los paladares de nuestros consumidores La \"Salsa Macha\" con el sabor cultural de cada región del país qué complace a todos los paladares de nuestros consumidores La \"Salsa Macha\" con el sabor cultural de cada región del país qué complace a todos los paladares de nuestros consumidores",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
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
  }

  SliverAppBar appbar(BuildContext context, List getImages) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/images/${getImages[indexGetImagesList]}',
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
              builder: (BuildContext context) => const Home(),
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
