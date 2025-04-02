
import 'package:dartz/dartz.dart';

import '../../../../connection/network_info.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/Orders_entity.dart';
import '../../domain/repositories/orders_repository.dart';
import '../datasources/orders_remote_data_source.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final NetworkInfo networkInfo;
  final OrdersRemoteDataSource ordersRemoteDataSource;

  OrdersRepositoryImpl({
    required this.networkInfo,
    required this.ordersRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<OrdersEntity>>> getAllOrders() async {
    try {
      final isConnected = await networkInfo.isConnected ?? false;

      if (isConnected) {
        // Fetch data from the remote data source
        final allOrdersModel = await ordersRemoteDataSource.getAllOrders();

        // Map the AllOrdersModel into a list of OrdersEntity
        final orders = allOrdersModel.orders.map((order) {
          return OrdersEntity(
            clientName: order.clientName,
            address: order.address,
            status: order.status,
          );
        }).toList();

        return Right(orders);
      } else {
        return Left(Failure(errMessage: AppStrings.noInternetTitle));
      }
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    } on CacheException catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    } catch (e) {
      return Left(
          Failure(errMessage: "Unexpected error occurred: ${e.toString()}"));
    }
  }
}
