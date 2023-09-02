import 'package:big_cart/core/constant.dart';
import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/Profile/CreateUser.dart';
import 'package:big_cart/features/Profile/screens/abouteApp.dart';

import 'package:big_cart/features/Profile/screens/favorite/favoritScreen.dart';
import 'package:big_cart/features/view/Profile/screens/abouteMe.dart';
import 'package:big_cart/features/view/Profile/widgets/RowTemplete.dart';

import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';

import 'screens/feedBackScreen.dart';

class profileScreen extends StatelessWidget {
  profileScreen({super.key});
  final ExpandedTileController _controller = ExpandedTileController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          // alignment: Alignment.topCenter,
          children: [
            Container(
                height: double.infinity,
                color: AppStyle.backgroundColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefultWidget.productText(text: 'Hussein Salah'),
                          DefultWidget.defultdesrption(
                              text: 'husseinsalah@gmail.com'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RowTemplete(
                        icon: IconlyLight.profile,
                        text: 'About me',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const abouteMe_screen();
                            },
                          ));
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    RowTemplete(
                      icon: IconlyLight.heart,
                      text: 'My Favorites',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const favoritScreen();
                          },
                        ));
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RowTemplete(
                      icon: Icons.people_alt_rounded,
                      text: 'Give Me FeedBack',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const feedBackScreen();
                          },
                        ));
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RowTemplete(
                      icon: Icons.edit,
                      text: 'Edit Me profile',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CreateUserScreen();
                          },
                        ));
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RowTemplete(
                      icon: IconlyLight.info_circle,
                      text: 'About',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const abouteApp_screen();
                          },
                        ));
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                )),
            Positioned(
              top: 30,
              left: 120,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        const CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage('assets/images/pr.JPG'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Icon(IconlyLight.camera),
                        ),
                      ],
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
}
