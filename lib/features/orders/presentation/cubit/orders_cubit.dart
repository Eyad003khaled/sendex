
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/services/injection.dart';
import '../../domain/entities/Orders_entity.dart';
import '../../domain/usecases/get_all_orders_usecase.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetAllOrdersUseCase getAllOrdersUseCase;

  OrdersCubit() : getAllOrdersUseCase = getIt<GetAllOrdersUseCase>(), super(OrdersInitialState());

  Future<void> fetchAllOrders() async {
    try{
    emit(GetOrdersLoadingState());
    final orders = await getAllOrdersUseCase.call();

    orders.fold(
      (failure) => _handleFailure(failure),
      (orders) => emit(GetOrdersSuccessState(orders)),
    );
    }
    catch (e) {
      _handleUnexpectedError(e);
    }
  }
    void _handleFailure(dynamic failure) {
    // showToast(false, tr(AppStrings.noInternetTitle),
    //     tr(AppStrings.noInternetSubtitle));
    emit(GetOrdersFailureState(error: failure.errMessage));
    if (kDebugMode) {
      print(failure.errMessage);
    }
  }
  void _handleUnexpectedError(dynamic error) {
  //  showToast(false, "Loading Data Failed", 'Unexpected error: ${error.toString()}');
    emit(GetOrdersFailureState(error: 'Unexpected error: ${error.toString()}'));
    if (kDebugMode) {
      print('Unexpected error: ${error.toString()}');
    }
  }
}