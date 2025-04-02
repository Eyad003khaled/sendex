part of 'orders_cubit.dart';

abstract class OrdersState {}

class OrdersInitialState extends OrdersState {}

class GetOrdersLoadingState extends OrdersState {}

class GetOrdersSuccessState extends OrdersState {
  final List<OrdersEntity> orders;
  GetOrdersSuccessState(this.orders);
}

class GetOrdersFailureState extends OrdersState {
  final String error;
  GetOrdersFailureState({required this.error});
}
