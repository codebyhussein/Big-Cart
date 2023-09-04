import 'package:big_cart/core/constant.dart';

import 'package:big_cart/features/controller/HomeCubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class favoritTemplete extends StatelessWidget {
  favoritTemplete({super.key});
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is increseOne) {
          counter++;
        }
        if (state is decreseOne) {
          counter--;
        }
      },
      builder: (context, state) {
        return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 110,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/fav.png'),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '\$08:00',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          DefultWidget.productText(text: 'Fresh Peach'),
                          SizedBox(
                            height: 6.h,
                          ),
                          const Text(
                            '2.0 lbs',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await BlocProvider.of<HomeCubit>(context)
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
                      Text(counter.toString()),
                      SizedBox(
                        height: 3.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await BlocProvider.of<HomeCubit>(context)
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
            ));
      },
    );
  }
}
