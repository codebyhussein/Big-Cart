import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/controller/CartCubit/cart_cubit.dart';
import 'package:big_cart/features/view/home/Screens/Profile/widgets/CustomAppBar.dart';

import 'package:big_cart/features/view/home/Screens/cart/cartScreenEmpty.dart';
import 'package:big_cart/features/view/home/Screens/cart/widget/productItemCart.dart';
import 'package:big_cart/features/view/home/layoutScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.backgroundColor,
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddProductToCart) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Added item Done',
                    style: TextStyle(color: Colors.white))));
          }
          if (state is RemoveSuccsee) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Remove item Done',
                    style: TextStyle(color: Colors.white))));
          }
          if (state is RemoveFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMassege,
                    style: const TextStyle(color: Colors.white))));
          }
        },
        builder: (context, state) {
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
                  title: 'Shopping Cart'),
              SizedBox(
                height: 600.h,
                child: FutureBuilder<List<ProductModel>>(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(child: Text('An error occurred'));
                    }
                    if (snapshot.hasData) {
                      List<ProductModel> productList = snapshot.data!;

                      return productList.isEmpty
                          ? const cartScreenEmpty()
                          : GridView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 250,
                                      mainAxisExtent: 250,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: productList.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return ProductItemCart(
                                  index: index,
                                  onTap: () async {
                                    SharedPreferences preferences =
                                        await SharedPreferences.getInstance();
                                    String? currentCartItemID = preferences
                                        .getString('currentCartItemID');
                                    if (currentCartItemID != null) {
                                      BlocProvider.of<CartCubit>(context)
                                          .RemoveFromCart(
                                              currentCartItemID:
                                                  currentCartItemID);
                                    }
                                  },
                                  productModel: productList[index],
                                );
                              },
                            );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppStyle.kmainColor,
                    ));
                  },
                  future: BlocProvider.of<CartCubit>(context).GetCartProduct(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
