import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex_test/core/widgets/redacted/custom_redacted_order_item.dart';

import '../../../../core/errors/no_internet_connection.dart';
import '../../../../core/functions/Toast/custom_toast.dart';

import '../../../../core/routes/app_router.dart';
import '../cubit/orders_cubit.dart';

import 'items/custom_order_list_view_item.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is GetOrdersLoadingState) {
          // Return redacted version while loading
          return const CustomRedactedOrderItem();
        } else if (state is GetOrdersFailureState) {
          // Handle failure state
          return NoInternetConnection(
            fetchDataCallback: () =>
                BlocProvider.of<OrdersCubit>(context).fetchAllOrders(),
          );
        } else if (state is GetOrdersSuccessState) {
          return buildOrderssList(
            allOrdersClientName: state.orders.map((c) => c.clientName).toList(),
            allOrdersAddress: state.orders.map((c) => c.address).toList(),
            allOrdersStatus: state.orders.map((c) => c.status).toList(),
            context: context,
          );
        } else {
          // Handle other cases
          return showToast(false, "Error", "Something Went Wrong");
        }
      },
    );
  }

  Widget buildOrderssList({
    required List<String> allOrdersClientName,
    required List<String> allOrdersAddress,
    required List<String> allOrdersStatus,
    required BuildContext context,
  }) {
    
    return Column(
      children: List.generate(allOrdersClientName.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomOrderListViewItem(
            clientName: allOrdersClientName[index],
            address: allOrdersAddress[index],
            status: allOrdersStatus[index],
            buttonOnPressed: () {
              Navigator.pushNamed(
                context,
                AppRouter.orderDetailsScreen,
                arguments: {
                  'clientName': allOrdersClientName[index],
                  'clientAddress': allOrdersAddress[index],
                  'status': allOrdersStatus[index],
                },
              );
            },
          ),
        );
      }),
    );
  }
}
