import 'package:big_cart/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildItem1 extends StatelessWidget {
  const BuildItem1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 96.h,
        ),
        Image.asset(
          'assets/images/onbording11.png',
          height: 300.h,
          width: 287.w,
        ),
        DefultWidget.defultText(text: 'Buy Grocery'),
        SizedBox(
          height: 10.h,
        ),
        DefultWidget.defultdesrptionOnboarding(
          text:
              'Welcome to Big Cart Supermarket!\nYour one-stop destination for all\n your grocery needs.',
        ),
      ],
    );
  }
}
