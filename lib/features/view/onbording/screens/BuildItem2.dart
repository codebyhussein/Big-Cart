import 'package:big_cart/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildItem2 extends StatelessWidget {
  const BuildItem2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 96.h,
        ),
        Image.asset(
          'assets/images/onborading22.png',
          height: 300.h,
          width: 287.w,
        ),
        DefultWidget.defultText(text: 'Fast Delivery'),
        SizedBox(
          height: 10.h,
        ),
        DefultWidget.defultdesrptionOnboarding(
            text:
                "Tailor your shopping experience\n with us Select your favorite\n categories of products"),
      ],
    );
  }
}
