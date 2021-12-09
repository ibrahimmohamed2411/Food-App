part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class Loading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final Products products;
  ProductsLoaded({required this.products});
}

class Error extends ProductsState {
  final String errorMessage;
  Error({required this.errorMessage});
}
