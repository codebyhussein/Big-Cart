import 'package:big_cart/core/style.dart';

import 'package:big_cart/features/view/auth/login/LoginScreen.dart';
import 'package:big_cart/features/view/onbording/screens/BuildItem1.dart';
import 'package:big_cart/features/view/onbording/screens/BuildItem2.dart';
import 'package:big_cart/features/view/onbording/screens/BuildItem3.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80.h),
        child: PageView(
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              isLastPage = value == 2;
            });
          },
          children: const [
            BuildItem1(),
            BuildItem2(),
            BuildItem3(),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppStyle.kmainColor),
                  child: MaterialButton(
                      onPressed: () async {
                        await Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ));
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppinlight',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        )),
                    SmoothPageIndicator(
                      controller: controller,
                      onDotClicked: (index) {
                        controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      count: 3,
                      effect: WormEffect(
                          dotWidth: 24.0,
                          dotHeight: 16.0,
                          type: WormType.thinUnderground,
                          activeDotColor: AppStyle.kmainColor),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(microseconds: 100),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppinlight',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
    );
  }
}
