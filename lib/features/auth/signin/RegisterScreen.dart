import 'package:big_cart/Cubit/RegisterCubit/register_cubit.dart';
import 'package:big_cart/Widgets/CustomButton.dart';
import 'package:big_cart/Widgets/CustomTextFormField.dart';
import 'package:big_cart/core/constant.dart';
import 'package:big_cart/features/auth/login/LoginScreen.dart';
import 'package:big_cart/features/home/layoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

//  import 'buttons/lib/src/custom_button.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isvesible = true;
  bool isChecked = false;
  bool isloading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isloading = true;
        } else if (state is RegisterSuccess) {
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
              return const RegisterScreen();
            },
          ));
        } else if (state is RegisterChange) {
          isvesible = !isvesible;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 320.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/register.png'),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Create account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black),
                            ),
                            DefultWidget.defultdesrption(
                                text: 'Quickly create account'),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextFormField(
                              isvisble: false,
                              nameofController: emailController,
                              hintText: 'Email address',
                              labelText: 'Email address',
                              validateText: 'email address is required',
                              keyBoredType: TextInputType.emailAddress,
                              prefixIcon: const Icon(Icons.email_outlined),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextFormField(
                              isvisble: false,
                              nameofController: phoneController,
                              hintText: 'Phone number',
                              labelText: 'Phone number',
                              validateText: 'Phone number is required',
                              keyBoredType: TextInputType.phone,
                              prefixIcon: const Icon(Icons.phone),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextFormField(
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
                                      .change(value: isvesible);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomButton(
                          onpressed: () async {
                            if (formKey.currentState!.validate()) {
                              await BlocProvider.of<RegisterCubit>(context)
                                  .CreateUser(
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const layoutScreen();
                                },
                              ));
                            }
                          },
                          text: 'Signup'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefultWidget.defultdesrption(
                              text: "Already have an account ?"),
                          SizedBox(
                            width: 5.w,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginScreen();
                                  },
                                ));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}
