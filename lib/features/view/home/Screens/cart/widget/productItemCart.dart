import 'package:big_cart/core/constant.dart';
import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';

class ProductItemCart extends StatefulWidget {
  ProductItemCart(
      {super.key,
      required this.productModel,
      required this.onTap,
      required this.index});
  ProductModel productModel;
  VoidCallback onTap;
  int index;
  List<String> imageList = [
    'assets/images/item3.png',
    'assets/images/item2.png',
    'assets/images/item1.png',
    'assets/images/veg1.png'
  ];
  @override
  State<ProductItemCart> createState() => _ProductItemCartState();
}

class _ProductItemCartState extends State<ProductItemCart> {
  bool isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color(0XFFF4F5F9)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: 210.h,
            width: 160.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [AppStyle.defaultBoxShadow],
                color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isfavorite = !isfavorite;
                            });
                          },
                          child: Icon(IconlyBold.heart,
                              color: isfavorite
                                  ? Colors.red
                                  : const Color.fromARGB(255, 236, 235, 235))),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset('assets/images/veg1.png'),
                    Image.asset(widget.imageList[widget.index]),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      '\$ ' '${widget.productModel.price}' '.00',
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    DefultWidget.productText(
                        text: widget.productModel.ProductName!),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      widget.productModel.Quantity!,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Icon(IconlyLight.delete),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        DefultWidget.addToCartText(text: 'Remove')
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ]));
  }
}
