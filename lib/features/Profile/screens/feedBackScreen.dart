import 'package:big_cart/Cubit/HomeCubit/home_cubit.dart';
import 'package:big_cart/Widgets/CustomButton.dart';
import 'package:big_cart/core/constant.dart';
import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/home/layoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';

import '../widgets/CustomAppBar.dart';

class feedBackScreen extends StatefulWidget {
  const feedBackScreen({super.key});

  @override
  State<feedBackScreen> createState() => _feedBackScreenState();
}

class _feedBackScreenState extends State<feedBackScreen> {
  String? feedBackText;

  double? feedBackvalue = 0;

  TextEditingController FeedBackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeLoading) {
            } else if (state is HomeSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const layoutScreen()),
              );

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(milliseconds: 1000),
                  content: Text(
                    '''
      Thank you again for choosing our platform,
      and for considering sharing your feedback,
      with us. We truly appreciate it.''',
                    style: TextStyle(color: Colors.white),
                  )));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(onPressed: () {}, title: 'Write Reviews'),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 250.h,
                    width: double.infinity,
                    color: AppStyle.backgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefultWidget.defultText(text: 'What do you think ?'),
                        SizedBox(
                          height: 10.h,
                        ),
                        DefultWidget.defultdesrption(
                            text:
                                'please give your rating by clicking on\nthe stars below'),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            feedBackvalue = rating;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                    width: double.infinity,
                    child: TextFormField(
                      controller: FeedBackController,
                      textAlign: TextAlign.start,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      textDirection: TextDirection.ltr,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          IconlyLight.edit,
                          color: Colors.amber,
                        ),
                        labelText: 'Tell us about your experience',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        hintText: 'feedback',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomButton(
                    onpressed: () async {
                      await BlocProvider.of<HomeCubit>(context).FeedBackMethod(
                          FeedBackvalue: feedBackvalue!,
                          FeedBackText: FeedBackController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const layoutScreen()),
                      );
                    },
                    text: 'Start shopping',
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
