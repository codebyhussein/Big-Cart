import 'package:big_cart/features/view/Profile/widgets/pofileItemBuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AppStyle {
  static Color kmainColor = const Color(0xffAEDC81);
  static Color backgroundColor = const Color(0xffF4F5F9);
  static List<Widget> ProfileItem = [
    ProfileItemBuilder(
        icon: const Icon(
          CupertinoIcons.heart,
          color: Colors.white,
        ),
        description: 'See you favourite products',
        title: 'Favourites'),
    ProfileItemBuilder(
        icon: const Icon(
          Icons.language,
          color: Colors.white,
        ),
        description: 'Choose your languages',
        title: 'Languages'),
    ProfileItemBuilder(
        icon: const Icon(
          IconlyLight.profile,
          color: Colors.white,
        ),
        description: 'Change your account information',
        title: 'Profile'),
    ProfileItemBuilder(
        icon: const Icon(
          Icons.list,
          color: Colors.white,
        ),
        description: 'See order history',
        title: 'Orders'),
    ProfileItemBuilder(
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
        description: '',
        title: 'Contact Us'),
    ProfileItemBuilder(
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
        description: '',
        title: 'About Us'),
  ];

  static const BoxShadow defaultBoxShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.25),
    offset: Offset(0, 4),
    blurRadius: 4,
    spreadRadius: 0,
  );
}
