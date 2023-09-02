import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class DefultBottomNavigationBar extends StatefulWidget {
  DefultBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });
  int currentIndex;

  @override
  State<DefultBottomNavigationBar> createState() =>
      _DefultBottomNavigationBarState();
}

class _DefultBottomNavigationBarState extends State<DefultBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().scaleWidth,
      height: 60.h,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                widget.currentIndex = 0;
              });
            },
            icon: widget.currentIndex == 0
                ? const Icon(
                    IconlyBold.home,
                    color: Color(0xFF025464),
                    size: 25,
                  )
                : const Icon(
                    IconlyBold.home,
                    size: 20,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                widget.currentIndex = 1;
              });
            },
            icon: widget.currentIndex == 1
                ? const Icon(
                    Icons.shopping_cart_rounded,
                    color: Color(0xFF025464),
                    size: 25,
                  )
                : const Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                widget.currentIndex = 2;
              });
            },
            icon: widget.currentIndex == 2
                ? const Icon(
                    IconlyLight.heart,
                    color: Color(0xFF025464),
                    size: 25,
                  )
                : const Icon(
                    IconlyBold.heart,
                    size: 20,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                widget.currentIndex = 3;
              });
            },
            icon: widget.currentIndex == 3
                ? const Icon(
                    IconlyLight.profile,
                    color: Color(0xFF025464),
                    size: 25,
                  )
                : const Icon(
                    IconlyLight.profile,
                    size: 20,
                  ),
          ),
        ],
      ),
    );
  }
}

/*
BottomNavigationBar(
        selectedFontSize: 28,
        elevation: 0,
        currentIndex: widget.currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: (value) {
          setState(() {
            widget.currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            activeIcon: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                IconlyLight.home,
              ),
            ),
            icon: Icon(
              IconlyLight.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                IconlyLight.category,
              ),
            ),
            icon: Icon(
              IconlyLight.category,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                IconlyLight.heart,
              ),
            ),
            icon: Icon(
              IconlyLight.heart,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                IconlyLight.profile,
              ),
            ),
            icon: Icon(
              IconlyLight.profile,
            ),
            label: '',
          )
        ]);
*/