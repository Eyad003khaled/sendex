
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/all_orders_model.dart';

class OrdersRemoteDataSource {
  final ApiConsumer api;

  OrdersRemoteDataSource({required this.api});

  Future<AllOrdersModel> getAllOrders()async {
    try {
      final response = await api.get(Endpoints.orders);
      return  AllOrdersModel.fromJson(response);
    } catch (error) {

      throw ServerException(
        errorModel: ErrorModel(
          errorMessage: 'Failed to fetch All Orders: ${error.toString()}', status: false,
        ),
      );
    }
  }
}
