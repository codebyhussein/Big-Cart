import 'package:big_cart/Cubit/LoginCubit/login_cubit.dart';
import 'package:big_cart/features/Widgets/CustomButton.dart';
import 'package:big_cart/features/Widgets/CustomTextFormField.dart';
import 'package:big_cart/core/constant.dart';
import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/auth/signin/RegisterScreen.dart';
import 'package:big_cart/features/home/layoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

//  import 'buttons/lib/src/custom_button.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isvesible = true;
  bool isChecked = false;
  bool isloading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isloading = true;
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMassege,
                  style: const TextStyle(color: Colors.white))));
          isloading = true;

          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ));
        } else if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Welcome in the Big Cart',
                  style: TextStyle(color: Colors.white))));
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const layoutScreen();
            },
          ));
          isloading = false;
        } else if (state is LoginChange) {
          isvesible = !isvesible;
        } else if (state is LoginRemberMeChange) {
          isChecked = !isChecked;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          progressIndicator: CircularProgressIndicator(
            color: AppStyle.kmainColor,
          ),
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
                                image: AssetImage('assets/images/login.png'),
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
                              'Welcome !',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black),
                            ),
                            DefultWidget.defultdesrption(
                                text: 'Sign in to your account'),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextFormField(
                              isvisble: false,
                              nameofController: emailController,
                              hintText: 'email',
                              labelText: 'email',
                              validateText: 'email is required',
                              keyBoredType: TextInputType.emailAddress,
                              prefixIcon: const Icon(Icons.email_outlined),
                            ),
                            const SizedBox(
                              height: 20,
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
                                  await BlocProvider.of<LoginCubit>(context)
                                      .vesiblePassword(isvesible: isvesible);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    checkColor: Colors.black,
                                    fillColor: MaterialStateColor.resolveWith(
                                        (states) => const Color.fromARGB(
                                            255, 227, 224, 224)),
                                    value: isChecked,
                                    onChanged: (isChecked) async {
                                      await BlocProvider.of<LoginCubit>(context)
                                          .rememberMe(value: isChecked!);
                                    }),
                                SizedBox(
                                  width: 6.h,
                                ),
                                DefultWidget.defultdesrption(
                                    text: "Remember me"),
                              ],
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot password",
                                  style: TextStyle(
                                    color: Color.fromRGBO(64, 125, 198, 1),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButton(
                          onpressed: () async {
                            if (formKey.currentState!.validate()) {
                              await BlocProvider.of<LoginCubit>(context)
                                  .loginUser(
                                      email: emailController.text,
                                      password: passwordController.text);
                              // Navigator.push(context, MaterialPageRoute(
                              //   builder: (context) {
                              //     return const layoutScreen();
                              //   },
                              // ));
                            }
                          },
                          text: 'Login'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefultWidget.defultdesrption(
                              text: "Don't have an account ?"),
                          SizedBox(
                            width: 5.w,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const RegisterScreen();
                                  },
                                ));
                              },
                              child: Text(
                                "Sign up",
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
