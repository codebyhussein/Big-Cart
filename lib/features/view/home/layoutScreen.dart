import 'package:big_cart/core/style.dart';

import 'package:big_cart/features/home/category/view/categoryScreen.dart';
import 'package:big_cart/features/view/Profile/profileScreen.dart';
import 'package:big_cart/features/view/home/BottomNavigationBar/Screens/cart/cartScreenFull.dart';
import 'package:big_cart/features/view/home/BottomNavigationBar/Screens/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 50.h,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, -2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: currentIndex == 0
                    ? Icon(
                        IconlyBold.home,
                        color: AppStyle.kmainColor,
                        size: 32,
                      )
                    : const Icon(
                        IconlyLight.home,
                        size: 20,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: currentIndex == 1
                    ? Icon(
                        Icons.shopping_cart_rounded,
                        color: AppStyle.kmainColor,
                        size: 32,
                      )
                    : const Icon(
                        Icons.shopping_cart_outlined,
                        size: 20,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: currentIndex == 2
                    ? Icon(
                        IconlyBold.category,
                        color: AppStyle.kmainColor,
                        size: 32,
                      )
                    : const Icon(
                        IconlyLight.category,
                        size: 20,
                      ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: currentIndex == 3
                    ? Icon(
                        IconlyBold.profile,
                        color: AppStyle.kmainColor,
                        size: 32,
                      )
                    : const Icon(
                        IconlyLight.profile,
                        size: 20,
                      ),
              ),
            ],
          ),
        ));
  }
}
