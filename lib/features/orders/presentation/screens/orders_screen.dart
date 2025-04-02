import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/injection.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/orders_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: BlocProvider(
          create: (context) => getIt.get<OrdersCubit>()..fetchAllOrders(),
          child: const OrdersWidget(),
        ),
      ),
    );
  }
}
