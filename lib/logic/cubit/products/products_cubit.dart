import 'package:bloc/bloc.dart';
import 'package:food_app/data/models/products.dart';
import 'package:food_app/data/repositories/products_repository.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _productsRepository = ProductsRepository();
  ProductsCubit() : super(ProductsInitial());
  void getProducts() async {
    try {
      Products products = await _productsRepository.geProducts();
      emit(
        ProductsLoaded(products: products),
      );
    } catch (e) {
      emit(Error(errorMessage: e.toString()));
    }
  }
}
