import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DefultAppBar extends StatelessWidget {
  DefultAppBar({super.key, required this.onPressed, required this.title});
  VoidCallback onPressed;
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          IconlyLight.arrow_left,
          color: Colors.black,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/icon.png'),
        )
      ],
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(fontFamily: 'poppin', color: Colors.black),
      ),
      centerTitle: true,
    );
  }
}
