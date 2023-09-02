import 'package:big_cart/core/constant.dart';
import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/view/onbording/onbordingScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Default splash 1.png'),
              fit: BoxFit.cover)),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 96.h,
          ),

          DefultWidget.defultText(text: 'Welcome to'),
          Image.asset(
            'assets/images/splash.png',
            height: 50.h,
            width: 127.w,
          ),
          // Figma Flutter Generator LoremipsumdolorsitametconsetetursadipscingelitrseddiamnonumyWidget - TEXT
          DefultWidget.defultdesrptionOnboarding(
            text:
                'Your Ultimate Shopping App Browse.\n Start Your Journey Today Choose. Enjoy!',
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                  radius: 30,
                  backgroundColor: AppStyle.kmainColor,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const OnBordingScreen(),
                                isIos: true));
                      },
                      icon: const Icon(
                        IconlyBold.arrow_right_3,
                        color: Colors.white,
                        size: 30,
                      ))),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    ));
  }
}
