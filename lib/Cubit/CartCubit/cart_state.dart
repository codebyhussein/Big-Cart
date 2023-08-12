part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class AddProductToCart extends CartState {}

class CartImpty extends CartState {}

class RemoveSuccsee extends CartState {}

class RemoveFailure extends CartState {
  String errorMassege;
  RemoveFailure({
    required this.errorMassege,
  });
}

class increaseOneQuntatiy extends CartState {}

class decreaseOneQuntatiy extends CartState {}

class isFavQuntatiy extends CartState {}
