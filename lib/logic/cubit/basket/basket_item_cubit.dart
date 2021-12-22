import 'package:bloc/bloc.dart';

part 'basket_item_state.dart';

class BasketItemCubit extends Cubit<BasketItemState> {
  BasketItemCubit() : super(BasketItemState(itemCount: 1));
  void increment() {
    emit(BasketItemState(itemCount: state.itemCount + 1));
  }

  void decrement() {
    if (state.itemCount > 1) {
      emit(BasketItemState(itemCount: state.itemCount - 1));
    }
  }
}
