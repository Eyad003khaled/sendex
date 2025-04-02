import 'package:dartz/dartz.dart';
import 'package:sendex_test/features/orders/domain/entities/Orders_entity.dart';


import '../../../../core/errors/failure.dart';

import '../repositories/orders_repository.dart';



class GetAllOrdersUseCase {
  final OrdersRepository repository;

  GetAllOrdersUseCase({required this.repository});
  Future<Either<Failure, List<OrdersEntity>>> call() async {
    return await repository.getAllOrders();
  }
}
