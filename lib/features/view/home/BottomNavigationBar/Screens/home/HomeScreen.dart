import 'package:big_cart/core/constant.dart';
import 'package:big_cart/features/home/category/view/categoryScreen.dart';
import 'package:big_cart/features/view/Product/widgets/FetchData.dart';
import 'package:big_cart/features/view/home/category/view/categoryFilter.dart';
import 'package:big_cart/features/view/home/widgets/DefultSearchWidget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';

import '../../../widgets/Slider.dart';

class FeatureDataScreen extends StatefulWidget {
  const FeatureDataScreen({
    super.key,
  });

  @override
  State<FeatureDataScreen> createState() => _FeatureDataScreenState();
}

class _FeatureDataScreenState extends State<FeatureDataScreen> {
  String? Search;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        // scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            DefultTextFormFieldSearch(
              text: 'Search keywords..',
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Search = value;
              },
              prefixIcon: IconlyLight.search,
              ispassword: false,
              ontap: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            const CarouselWithIndicatorDemo(),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontFamily: 'poppins', fontSize: 18.sp),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const CategoryScreen();
                      },
                    ));
                  },
                  child: const Icon(IconlyLight.arrow_right_2),
                )
              ],
            ),
            SizedBox(
              height: 70.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return categoryFilter(
                              index: index,
                            );
                          },
                        ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                listImage.CategoryList[index]['categoryImage'],
                              )),
                          Text(
                            listImage.CategoryList[index]['categoryName'],
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10.w,
                    );
                  },
                  itemCount: listImage.CategoryList.length),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured products',
                  style: TextStyle(fontFamily: 'poppins', fontSize: 18.sp),
                ),
                const Icon(IconlyLight.arrow_right_2)
              ],
            ),
            Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF4F5F9),
                ),
                child: const FeaturedProduct()),
          ],
        ),
      ),
    );
  }
}
