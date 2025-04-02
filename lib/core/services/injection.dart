import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../connection/network_info.dart';
import '../../features/orders/data/datasources/orders_remote_data_source.dart';
import '../../features/orders/data/repositories/orders_repository_impl.dart';
import '../../features/orders/domain/repositories/orders_repository.dart';
import '../../features/orders/domain/usecases/get_all_orders_usecase.dart';

import '../../features/orders/presentation/cubit/orders_cubit.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';

final getIt = GetIt.instance;
void initGetIt() {

    //! constants

  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(
        dio: Dio(),
      
      ));
  getIt.registerLazySingleton(() => DataConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(getIt<DataConnectionChecker>()));



        //!Orders

// Data Layer

  getIt.registerLazySingleton(
      () => OrdersRemoteDataSource(api: getIt<ApiConsumer>()));
  getIt.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(
      ordersRemoteDataSource: getIt<OrdersRemoteDataSource>(),

      networkInfo: getIt<NetworkInfo>(), 

    ),
  );

// Domain Layer
  getIt.registerLazySingleton(
      () => GetAllOrdersUseCase(repository: getIt<OrdersRepository>()));

// Presentation Layer
  getIt.registerFactory(() => OrdersCubit());
}
