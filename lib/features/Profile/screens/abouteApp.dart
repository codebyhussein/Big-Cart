import 'package:big_cart/Widgets/CustomButton.dart';
import 'package:big_cart/core/constant.dart';
import 'package:big_cart/features/home/layoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';

class abouteApp_screen extends StatelessWidget {
  const abouteApp_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              height: 90.h,
              title: 'Aboute App',
            ),
            SizedBox(
              height: 10.h,
            ),
            DefultWidget.defultText(text: 'The big cart'),
            DefultWidget.defultdesrption(
                text:
                    'application is a  commercial application for a comprehensive store that contains many different food sections, including vegetables, fruits, legumes, dairy, and many others.The application was programmed and developed by the Egyptian programmer / '),
            Text(
              'Hussein Salah',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            const Spacer(),
            CustomButton(
              onpressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const layoutScreen();
                  },
                ));
              },
              text: 'Start Shoping',
            ),
            SizedBox(
              height: 10.h,
            ),
            const Center(
                child: Text(
              'Contact',
              style: TextStyle(decoration: TextDecoration.underline),
            )),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/face.png'),
                SizedBox(
                  width: 15.w,
                ),
                Image.asset('assets/images/whats.png'),
                SizedBox(
                  width: 15.w,
                ),
                Image.asset('assets/images/teleg.png'),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    required this.height,
    required this.title,
  });
  double height;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        child: Center(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const layoutScreen();
                    },
                  ));
                },
                child: const Icon(IconlyLight.arrow_left),
              ),
              SizedBox(
                width: 80.w,
              ),
              Center(
                  child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              )),
            ],
          ),
        ));
  }
}
