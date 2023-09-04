import 'package:big_cart/core/constant.dart';
import 'package:big_cart/features/controller/CartCubit/cart_cubit.dart';
import 'package:big_cart/features/view/Product/widgets/Bottom.dart';
import 'package:big_cart/features/model/product_model.dart';
import 'package:big_cart/features/view/home/layoutScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class productDetailsScreen extends StatelessWidget {
  productDetailsScreen({super.key, required this.productModel});
  int counter = 0;
  bool isfav = false;
  ProductModel productModel;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is increaseOneQuntatiy) {
          counter++;
        }
        if (state is decreaseOneQuntatiy) {
          counter--;
        }
        if (state is isFavQuntatiy) {
          isfav = !isfav;
        }
        if (state is AddProductToCart) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Added item Done',
                  style: TextStyle(color: Colors.white))));

          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const layoutScreen();
            },
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: isloading,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset('assets/images/backGround.png'),
                      Stack(
                        children: [
                          Image.asset('assets/images/product1.png'),
                          Positioned(
                            left: 1.w,
                            // right: 320.w,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const layoutScreen();
                                  },
                                ));
                              },
                              child: const Icon(
                                IconlyLight.arrow_left,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(productModel.Quantity!),
                          GestureDetector(
                            onTap: () async {
                              await BlocProvider.of<CartCubit>(context)
                                  .isFavoriteProductDetails(isfavorite: isfav);
                            },
                            child: Icon(
                              IconlyBold.heart,
                              color: isfav
                                  ? Colors.red
                                  : const Color.fromARGB(255, 212, 209, 209),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            productModel.reviewValue.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          RatingBar.builder(
                            initialRating: productModel.reviewValue!.toDouble(),
                            minRating: 1,
                            itemSize: 20,
                            unratedColor:
                                const Color.fromARGB(255, 228, 228, 228),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(productModel.countReview!),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      DefultWidget.defultdesrption(
                        text: productModel.desciption!,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        height: 25.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefultWidget.defultdesrption(text: 'Quantity'),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await BlocProvider.of<CartCubit>(context)
                                        .increase(counter);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                const VerticalDivider(
                                  width: 20,
                                  thickness: 2,
                                  color: Colors.grey,
                                ),
                                Text(counter.toString()),
                                SizedBox(
                                  height: 3.h,
                                ),
                                const VerticalDivider(
                                  width: 20,
                                  thickness: 2,
                                  color: Colors.grey,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await BlocProvider.of<CartCubit>(context)
                                        .decrease(counter);
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Bottom(
                    onPressed: () async {
                      await BlocProvider.of<CartCubit>(context)
                          .AddToCart(productModel);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
