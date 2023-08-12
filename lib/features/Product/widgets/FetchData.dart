import 'package:big_cart/features/home/category/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ProductBilder.dart';

class FeaturedProduct extends StatefulWidget {
  const FeaturedProduct({super.key});

  @override
  State<FeaturedProduct> createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  Future<List<ProductModel>?> getProducts() async {
    CollectionReference productCollection =
        FirebaseFirestore.instance.collection('Product');

    QuerySnapshot response = await productCollection.get();

    List<ProductModel> productList = []; // List to store ProductModel objects

    for (QueryDocumentSnapshot element in response.docs) {
      Map<String, dynamic> data = element.data() as Map<String, dynamic>;

      // Assuming ProductModel has a named constructor that takes a map
      ProductModel product = ProductModel.fromJson(data);
      productList.add(product);
    }

    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,
      width: double.infinity,
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('error happend'));
          }
          if (snapshot.hasData) {
            List<ProductModel>? Data = snapshot.data;
            return GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: Data!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ProductBuilder(
                    index: index,
                    productModel: Data[index],
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
        future: getProducts(),
      ),
    );
  }
}
