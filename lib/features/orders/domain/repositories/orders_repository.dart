import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/Orders_entity.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrdersEntity>>> getAllOrders();
}



