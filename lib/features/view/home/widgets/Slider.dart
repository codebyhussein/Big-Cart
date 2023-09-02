import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<String> imgList = [
    "assets/images/home1.png",
    "assets/images/home1.png",
    "assets/images/home1.png",
    "assets/images/home1.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      CarouselSlider(
        items: imgList
            .map((item) => Container(
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 283.h,
                  ),
                ))
            .toList(),
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Padding(
        padding: EdgeInsets.only(left: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '20% off on your\nfirst purchase',
              style: TextStyle(fontFamily: 'poppins', fontSize: 18.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.w,
                    height: 6.h,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.green)
                          .withOpacity(_current == entry.key ? 0.9 : 0.3),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      )
    ]);
  }
}
