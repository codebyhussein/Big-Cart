import 'package:big_cart/core/constant.dart';
import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/home/layoutScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/CustomAppBar.dart';

class abouteMe_screen extends StatefulWidget {
  const abouteMe_screen({super.key});

  @override
  State<abouteMe_screen> createState() => _abouteMe_screenState();
}

class _abouteMe_screenState extends State<abouteMe_screen> {
  List<Map> getUserDetails = [];

  Future<void> getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var email = pref.getString('email'); // Use getString to retrieve the email

    if (email != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('usersDetails')
          .doc(email)
          .get();

      if (userDoc.exists) {
        setState(() {
          getUserDetails.add(userDoc.data() as Map<String, dynamic>);
        });
      } else {
        print("User document does not exist");
      }
    } else {
      print("Email not found in SharedPreferences");
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: getUserDetails.isEmpty
          ? Center(
              child: CircularProgressIndicator(
              color: style.kmainColor,
            ))
          : ListView.builder(
              itemCount: getUserDetails.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CustomAppBar(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const layoutScreen();
                            },
                          ));
                        },
                        title: 'About Me'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          DefultWidget.productText(text: 'Personal Details'),
                          Container(
                            color: Colors.white,
                            height: 60.h,
                            width: double.infinity,
                            child: Row(
                              children: [
                                const Icon(Icons.email_outlined),
                                SizedBox(
                                  width: 10.w,
                                ),
                                DefultWidget.defultdesrption(
                                    text: getUserDetails[0]['email'])
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            color: Colors.white,
                            height: 60.h,
                            width: double.infinity,
                            child: Row(
                              children: [
                                const Icon(IconlyLight.calendar),
                                SizedBox(
                                  width: 10.w,
                                ),
                                DefultWidget.defultdesrption(
                                    text: getUserDetails[0]['birthday'])
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            color: Colors.white,
                            height: 60.h,
                            width: double.infinity,
                            child: Row(
                              children: [
                                const Icon(Icons.phone),
                                SizedBox(
                                  width: 10.w,
                                ),
                                DefultWidget.defultdesrption(
                                    text: getUserDetails[0]['phone'])
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DefultWidget.productText(text: 'Password'),
                          Container(
                            color: Colors.white,
                            height: 60.h,
                            width: double.infinity,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.lock_open_outlined,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(getUserDetails[0]['password'])
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
    ));
  }
}
