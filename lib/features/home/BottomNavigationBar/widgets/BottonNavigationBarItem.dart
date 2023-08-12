import 'package:flutter/material.dart';
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
    return BottomNavigationBar(
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
  }
}
