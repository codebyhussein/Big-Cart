part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class AddProduct extends HomeState {}

class CartImpty extends HomeState {}

class HomeFailure extends HomeState {
  String errorMassege;
  HomeFailure({
    required this.errorMassege,
  });
}

class isFav extends HomeState {}

class increseOne extends HomeState {}

class decreseOne extends HomeState {}
