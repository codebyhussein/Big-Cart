import 'package:big_cart/features/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> AddToCart(ProductModel productModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var email = pref.get('email');
    try {
      emit(CartLoading());

      Map<String, dynamic> Data = productModel.toJson();

      // Save the document to Firestore
      DocumentReference cartItemRef =
          await FirebaseFirestore.instance.collection('AddToCart').add(Data);

      // Save the current document ID to SharedPreferences
      pref.setString('currentCartItemID', cartItemRef.id);

      emit(AddProductToCart());
    } on Exception catch (e) {
      print(e.toString());
      emit(RemoveFailure(errorMassege: 'An error occurred'));
    }
  }

  Future<void> RemoveFromCart({required String currentCartItemID}) async {
    try {
      emit(CartLoading());
      CollectionReference productCollection =
          FirebaseFirestore.instance.collection('AddToCart');
      await productCollection.doc(currentCartItemID).delete();
      emit(RemoveSuccsee());
    } on Exception {
      emit(RemoveFailure(errorMassege: 'An error occurred'));
    }
  }

  Future<List<ProductModel>> GetCartProduct() async {
    try {
      CollectionReference productCollection =
          FirebaseFirestore.instance.collection('AddToCart');

      QuerySnapshot response = await productCollection.get();

      List<ProductModel> cartList = [];

      for (QueryDocumentSnapshot element in response.docs) {
        Map<String, dynamic> data = element.data() as Map<String, dynamic>;

        // Assuming ProductModel has a named constructor that takes a map
        ProductModel product = ProductModel.fromJson(data);
        cartList.add(product);
      }
      return cartList;
    } on Exception {
      return [];
    }
  }

  increase(int counter) {
    counter = counter++;
    emit(increaseOneQuntatiy());
  }

  decrease(int counter) {
    counter = counter--;
    emit(decreaseOneQuntatiy());
  }

  isFavoriteProductDetails({
    required bool isfavorite,
  }) {
    isfavorite = !isfavorite;
    emit(isFavQuntatiy());
  }
}
