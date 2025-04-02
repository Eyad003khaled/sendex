import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/order_details_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String clientName;
  final String clientAddress;
  final String status;
  const OrderDetailsScreen({super.key, required this.clientName, required this.clientAddress,required this.status});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      body: OrderDetailsWidget(clientName: clientName,clientAddress:clientAddress ,status: status,),
    );
  }
}
