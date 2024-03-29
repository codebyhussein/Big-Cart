import 'package:big_cart/features/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  FeedBackMethod({
    required double FeedBackvalue,
    required String FeedBackText,
  }) async {
    try {
      emit(HomeLoading());
      SharedPreferences pref = await SharedPreferences.getInstance();

      var email = pref.getString('email');
      var documentReference = FirebaseFirestore.instance
          .collection("FeedBack")
          .doc(email)
          .set({'FeedBackText': FeedBackText, 'FeedBackvalue': FeedBackvalue});
      emit(HomeSuccess());
    } catch (e) {
      emit(HomeFailure(errorMassege: 'error name:$e '));
    } catch (e) {
      emit(HomeFailure(errorMassege: 'Somthing went wrong \nPlease try again'));
    }
  }

  isFavorite({
    required bool isfavorite,
  }) {
    isfavorite = !isfavorite;
    emit(isFav());
  }

  addProduct({required ProductModel productModel}) {
    try {
      emit(CartImpty());
      List<ProductModel> ProductCart = [];

      ProductCart.add(productModel);
      emit(AddProduct());
    } catch (e) {
      print(e.toString());
    }
  }

  increase(int counter) {
    counter = counter++;
    emit(increseOne());
  }

  decrease(int counter) {
    counter = counter--;
    emit(decreseOne());
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
}
