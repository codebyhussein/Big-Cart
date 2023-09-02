import 'package:big_cart/Cubit/CartCubit/cart_cubit.dart';
import 'package:big_cart/Cubit/HomeCubit/home_cubit.dart';
import 'package:big_cart/Cubit/LoginCubit/login_cubit.dart';
import 'package:big_cart/Cubit/RegisterCubit/register_cubit.dart';
import 'package:big_cart/features/auth/login/LoginScreen.dart';
import 'package:big_cart/features/home/layoutScreen.dart';
import 'package:big_cart/features/splash/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  final uid = pref.getString('uid');
  final email = pref.getString('email');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Widget? widget;

  if (uid != null || email != null) {
    widget = const layoutScreen();
  }
  if (uid == null || email == null) {
    widget = const SplashScreen();
  }

  runApp(MyApp(
    startWidget: widget!,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.startWidget});

  Widget startWidget;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
      ),
    );
  }
}
