import 'package:big_cart/core/constant.dart';
import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/view/Product/widgets/FetchData.dart';
import 'package:big_cart/features/view/home/layoutScreen.dart';

import 'package:flutter/material.dart';

import 'package:iconly/iconly.dart';

class categoryFilter extends StatelessWidget {
  categoryFilter({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const layoutScreen();
                },
              ));
            },
            icon: const Icon(
              IconlyLight.arrow_left,
              color: Colors.black,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Image.asset('assets/images/icon.png'),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            listImage.CategoryList[index]['categoryName'],
            style: const TextStyle(fontFamily: 'poppin', color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FeaturedProduct()));
  }
}
