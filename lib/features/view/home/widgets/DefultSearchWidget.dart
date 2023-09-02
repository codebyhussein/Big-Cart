import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefultTextFormFieldSearch extends StatelessWidget {
  DefultTextFormFieldSearch({
    super.key,
    required this.text,
    required this.onChanged,
    @required this.sufix,
    required this.ispassword,
    @required this.prefixIcon,
    @required this.keyboardType,
    @required this.ontap,
  });
  String? text;

  TextInputType? keyboardType;
  Function? ontap;

  IconData? prefixIcon;
  Function(String)? onChanged;
  Icon? sufix;
  bool ispassword = false;
  String? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.grey),
      onTap: () {
        ontap;
      },
      textDirection: TextDirection.ltr,
      keyboardType: keyboardType,
      obscureText: ispassword,
      decoration: InputDecoration(
          fillColor: const Color.fromRGBO(244, 245, 249, 1),
          filled: true,
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/icon2.png',
              height: 23.h,
              width: 23.w,
            ),
          ),
          hintText: '$text',
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey,
          )),
      onChanged: onChanged,
    );
  }
}
