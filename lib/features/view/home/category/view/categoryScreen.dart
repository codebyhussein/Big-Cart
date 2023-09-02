import 'package:big_cart/core/constant.dart';
import 'package:big_cart/core/style.dart';

import 'package:big_cart/features/view/Widgets/DefultAppBar.dart';
import 'package:big_cart/features/view/home/category/view/categoryFilter.dart';
import 'package:big_cart/features/view/home/layoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: Column(
        children: [
          DefultAppBar(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const layoutScreen();
                  },
                ));
              },
              title: 'Categories'),
          GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  mainAxisExtent: 150,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: 5,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return categoryFilter(
                          index: index,
                        );
                      },
                    ));
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                              listImage.CategoryList[index]['categoryImage'],
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          listImage.CategoryList[index]['categoryName'],
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
