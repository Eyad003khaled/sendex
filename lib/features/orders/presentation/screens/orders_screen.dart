import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex_test/features/orders/presentation/widgets/sections/orders_section.dart';

import '../../../../core/services/injection.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/orders_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      body: BlocProvider(
        create: (context) => getIt.get<OrdersCubit>()..fetchAllOrders(),
        child: const OrdersSection(),
      ),
    );
  }
}
