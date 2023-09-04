import 'package:big_cart/core/style.dart';

import 'package:big_cart/features/view/home/Screens/Profile/profileScreen.dart';
import 'package:big_cart/features/view/home/Screens/cart/cartScreenFull.dart';
import 'package:big_cart/features/view/home/Screens/home/HomeScreen.dart';
import 'package:big_cart/features/view/home/Screens/category/view/categoryScreen.dart';
import 'package:flutter/material.dart';

import 'package:iconly/iconly.dart';

class layoutScreen extends StatefulWidget {
  const layoutScreen({super.key});

  @override
  State<layoutScreen> createState() => _layoutScreenState();
}

class _layoutScreenState extends State<layoutScreen> {
  int currentIndex = 0;

  List<Widget> ScreenView = [
    const FeatureDataScreen(),
    const CartScreen(),
    const CategoryScreen(),
    profileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: ScreenView[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 25,
            elevation: 0,
            currentIndex: currentIndex,
            selectedItemColor: const Color(0xff6CC51D),
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            onTap: (value) {
              setState(() {
                currentIndex = value;
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
                    Icons.shopping_cart_outlined,
                  ),
                ),
                icon: Icon(
                  Icons.shopping_cart_outlined,
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
            ]));
  }
}
