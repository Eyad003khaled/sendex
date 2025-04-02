import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendex_test/core/widgets/redacted/custom_redacted_order_item.dart';

import '../../../../core/errors/no_internet_connection.dart';
import '../../../../core/functions/Toast/custom_toast.dart';

import '../cubit/orders_cubit.dart';

import 'items/custom_order_list_view_item.dart';

class OrdersCard extends StatelessWidget {

  const OrdersCard({
    Key? key,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is GetOrdersLoadingState) {
          // Return redacted version while loading
          return CustomRedactedOrderItem();
        } else if (state is GetOrdersFailureState) {
          // Handle failure state
          return NoInternetConnection(
            fetchDataCallback: () =>
                BlocProvider.of<OrdersCubit>(context).fetchAllOrders(),
          );
        } else if (state is GetOrdersSuccessState) {
          return buildOrderssList(
            allOrdersClientName: state.orders.map((c) => c.clientName).toList(),
            allOrdersAddress: state.orders
                .map((c) => c.address) // Convert nullable to non-nullable
                .toList(),
            allOrdersStatus: state.orders
                .map((c) => c.status) // Convert nullable to non-nullable
                .toList(),
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
    // If scroll is disabled, use a Column to display items without scrolling
    return Column(
      children: List.generate(allOrdersClientName.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomOrderListViewItem(
            clientName: allOrdersClientName[index],
            address: allOrdersAddress[index],
            status: allOrdersStatus[index],
          ),
        );
      }),
    );
  }
}
