import 'package:big_cart/features/Profile/profileScreen.dart';
import 'package:big_cart/features/home/BottomNavigationBar/Screens/cart/cartScreenFull.dart';
import 'package:big_cart/features/home/BottomNavigationBar/Screens/home/HomeScreen.dart';
import 'package:big_cart/features/home/category/view/categoryScreen.dart';
import 'package:flutter/material.dart';

import 'package:iconly/iconly.dart';

import 'category/model/product_model.dart';

class layoutScreen extends StatefulWidget {
  const layoutScreen({super.key});

  @override
  State<layoutScreen> createState() => _layoutScreenState();
}

class _layoutScreenState extends State<layoutScreen> {
  String? Search;
  PageController pageController = PageController();

  int BottomSHeetIndex = 0;
  ProductModel? productModel;
  List<ProductModel> ProductCart = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            BottomSHeetIndex = index;
          });
        },
        children: const [
          FeatureDataScreen(),
          CartScreen(),
          CategoryScreen(),
          profileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedFontSize: 28,
          elevation: 0,
          currentIndex: BottomSHeetIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (value) {
            setState(() {
              BottomSHeetIndex = value;
              pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            });
          },
          items: const [
            BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  IconlyLight.home,
                ),
              ),
              icon: Icon(
                IconlyLight.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  IconlyLight.bag,
                ),
              ),
              icon: Icon(
                IconlyLight.bag,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  IconlyLight.category,
                ),
              ),
              icon: Icon(
                IconlyLight.category,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  IconlyLight.profile,
                ),
              ),
              icon: Icon(
                IconlyLight.profile,
              ),
              label: '',
            )
          ]),
    );
  }
}
