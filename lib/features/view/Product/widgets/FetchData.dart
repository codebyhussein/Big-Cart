import 'package:big_cart/core/style.dart';
import 'package:big_cart/features/controller/HomeCubit/home_cubit.dart';

import 'package:big_cart/features/view/home/category/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ProductBilder.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460.h,
      width: double.infinity,
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('error happend'));
          } else if (snapshot.hasData) {
            List<ProductModel>? featuredProduct = snapshot.data;
            return GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: featuredProduct!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ProductBuilder(
                    index: index,
                    productModel: featuredProduct[index],
                  );
                });
          }
          return Center(
              child: CircularProgressIndicator(
            color: AppStyle.kmainColor,
          ));
        },
        future: BlocProvider.of<HomeCubit>(context).getProducts(),
      ),
    );
  }
}
