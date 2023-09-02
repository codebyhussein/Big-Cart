import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/controller/RegisterCubit/register_cubit.dart';
import 'package:big_cart/features/view/Profile/widgets/CustomAppBar.dart';
import 'package:big_cart/features/view/Widgets/CustomButton.dart';
import 'package:big_cart/features/view/home/layoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController birthdayController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController instaController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  bool isvesible = false;

  bool isloading = false;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterChange) {
          isvesible = !isvesible;
        }
        if (state is RegisterSuccess) {
          isloading = false;
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const layoutScreen();
            },
          ));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Welcome in the Big Cart',
                  style: TextStyle(color: Colors.white))));
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMassege,
                  style: const TextStyle(color: Colors.white))));
          isloading = false;

          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const CreateUserScreen();
            },
          ));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomAppBar(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const layoutScreen();
                          },
                        ));
                      },
                      title: 'Add Info'),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            UserTextFormField(
                              isvisble: false,
                              nameofController: nameController,
                              hintText: 'Name',
                              labelText: 'name',
                              validateText: 'Enter Your Name',
                              keyBoredType: TextInputType.text,
                              prefixIcon: const Icon(IconlyLight.profile),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            UserTextFormField(
                              isvisble: false,
                              nameofController: birthdayController,
                              hintText: 'Birthday',
                              labelText: 'Birthday',
                              validateText: 'Enter Your Birthday',
                              keyBoredType: TextInputType.number,
                              prefixIcon: const Icon(IconlyLight.calendar),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            UserTextFormField(
                              isvisble: false,
                              nameofController: phoneController,
                              hintText: 'Phone',
                              labelText: 'Phone',
                              validateText: 'Enter Your Phone',
                              keyBoredType: TextInputType.phone,
                              prefixIcon: const Icon(Icons.phone),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            UserTextFormField(
                              isvisble: false,
                              nameofController: emailController,
                              hintText: 'email',
                              labelText: 'email',
                              validateText: 'Enter Your email',
                              keyBoredType: TextInputType.emailAddress,
                              prefixIcon: const Icon(Icons.email_outlined),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            UserTextFormField(
                              isvisble: false,
                              nameofController: instaController,
                              hintText: 'instagram',
                              labelText: 'instagram',
                              validateText: 'Enter Your instagram',
                              keyBoredType: TextInputType.text,
                              prefixIcon:
                                  Image.asset('assets/images/insta.png'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            UserTextFormField(
                              isvisble: isvesible,
                              nameofController: passwordController,
                              hintText: 'password',
                              labelText: 'password',
                              validateText: 'password is required',
                              keyBoredType: TextInputType.visiblePassword,
                              prefixIcon: const Icon(
                                Icons.lock_open_outlined,
                              ),
                              suffixIcon: IconButton(
                                icon: isvesible
                                    ? const Icon(
                                        Icons.remove_red_eye,
                                      )
                                    : const Icon(
                                        Icons.remove_red_eye_outlined,
                                      ),
                                onPressed: () async {
                                  await BlocProvider.of<RegisterCubit>(context)
                                      .vesiblePassword(isvesible: isvesible);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            CustomButton(
                              text: 'Save Data',
                              onpressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await BlocProvider.of<RegisterCubit>(context)
                                      .UserDetails(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phone: phoneController.text,
                                          birthday: birthdayController.text,
                                          name: nameController.text,
                                          instagram: instaController.text);
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    )
        // },
        );
  }
}
/*
  
*/

class UserTextFormField extends StatefulWidget {
  UserTextFormField(
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
  State<UserTextFormField> createState() => _UserTextFormFieldState();
}

class _UserTextFormFieldState extends State<UserTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.nameofController,
      keyboardType: widget.keyBoredType,
      obscureText: widget.isvisble,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        suffixIconColor: AppStyle.kmainColor,
        hintText: widget.hintText,
        prefixIconColor: AppStyle.kmainColor,
        labelText: widget.labelText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
