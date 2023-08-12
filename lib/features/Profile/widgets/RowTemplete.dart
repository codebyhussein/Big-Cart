import 'package:big_cart/core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';

class RowTemplete extends StatelessWidget {
  RowTemplete(
      {super.key, required this.onTap, required this.icon, required this.text});

  IconData icon;
  String text;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.green,
              ),
              SizedBox(
                width: 8.h,
              ),
              DefultWidget.addToCartText(text: text),
            ],
          ),
          const Icon(IconlyLight.arrow_right_2),
        ],
      ),
    );
  }
}
