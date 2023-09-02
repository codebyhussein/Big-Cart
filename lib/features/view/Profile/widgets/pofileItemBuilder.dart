import 'package:big_cart/core/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItemBuilder extends StatelessWidget {
  ProfileItemBuilder(
      {super.key,
      required this.icon,
      required this.description,
      required this.title});
  String title;
  String description;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 33.h,
          width: 33.w,
          decoration: BoxDecoration(
            color: AppStyle.kmainColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SizedBox(height: 16.h, width: 16.w, child: icon),
        ),
        SizedBox(
          width: 25.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              description,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff1f1f1f),
              ),
            ),
          ],
        )
      ],
    );
  }
}
