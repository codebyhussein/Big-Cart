import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class DefultWidget {
  static Widget defultText({required String text}) => Text(
        text,
        style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 25.sp,
            fontWeight: FontWeight.normal),
      );

  static Widget defultdesrption({required String text}) => Text(
        text,
        maxLines: 6,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: const Color(0xff868889),
          fontFamily: 'poppinlight',
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
        ),
      );

  static Widget defultdesrptionOnboarding({required String text}) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xff868889),
          fontFamily: 'poppinlight',
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
        ),
      );

  static Widget productText({required String text}) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'poppin',
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
      );

  static Widget addToCartText({required String text}) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'poppin',
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
      );
}

class listImage {
  static List<Map<String, dynamic>> CategoryList = [
    {
      'categoryName': 'Vegetables',
      'categoryImage': 'assets/images/fav.png',
    },
    {
      'categoryName': 'Fruits',
      'categoryImage': 'assets/images/2.png',
    },
    {
      'categoryName': 'Beverages',
      'categoryImage': 'assets/images/3.png',
    },
    {
      'categoryName': 'Grocery',
      'categoryImage': 'assets/images/4.png',
    },
    {
      'categoryName': 'Edible oil',
      'categoryImage': 'assets/images/5.png',
    },
    {
      'categoryName': 'Fruits',
      'categoryImage': 'assets/images/2.png',
    },
  ];

  static List<String> imageList = [
    'assets/images/item3.png',
    'assets/images/item2.png',
    'assets/images/item1.png',
    'assets/images/veg1.png'
  ];
}
