import 'package:big_cart/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildItem3 extends StatelessWidget {
  const BuildItem3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 96.h,
          ),
          Image.asset(
            'assets/images/onborading33.png',
            height: 300.h,
            width: 287.w,
          ),
          DefultWidget.defultText(text: 'Enjoy Quality Food'),
          SizedBox(
            height: 10.h,
          ),
          DefultWidget.defultdesrptionOnboarding(
            text:
                'Checkout made simple! Add items\nto your cart review your selection\nand choose from flexible delivery options.',
          ),
        ],
      ),
    );
  }
}
