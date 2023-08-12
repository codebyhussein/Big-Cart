import 'package:big_cart/Widgets/DefultAppBar.dart';
import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/Profile/screens/favorite/widgets/fav_productTemplete.dart';
import 'package:big_cart/features/home/layoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class favoritScreen extends StatelessWidget {
  const favoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: style.backgroundColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: DefultAppBar(
            title: 'Favorites',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const layoutScreen();
              }));
            },
          )),
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return favoritTemplete();
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 15.h,
                    ),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
