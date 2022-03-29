import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/logic/cubit/order/order_cubit.dart';
import 'package:food_app/presentation/screens/order/widgets/order_item_widget.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoaded) {
            if (state.orderItems.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (_, index) => OrderItemWidget(
                  order: state.orderItems[index],
                ),
                itemCount: state.orderItems.length,
              );
            }
            return const Center(
              child: Text(
                'You don\'t have any orders',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (state is Error) {
            return Center(child: Text(state.message.toString()));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
