import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.validateText,
      required this.nameofController,
      required this.keyBoredType,
      required this.prefixIcon,
      @required this.suffixIcon,
      required this.isvisble});
  String hintText;
  String labelText;
  String validateText;
  TextEditingController nameofController;
  TextInputType keyBoredType;
  Widget prefixIcon;
  Widget? suffixIcon;
  bool isvisble = false;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.nameofController,
      keyboardType: widget.keyBoredType,
      obscureText: widget.isvisble,
      decoration: InputDecoration(
        // prefixIconColor: Colors.black,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return widget.validateText;
        } else {
          return null;
        }
      },
    );
  }
}
