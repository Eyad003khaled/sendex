import 'package:sendex_test/core/api/endpoints.dart';

import 'sub_models/order_details.dart';

class AllOrdersModel  {
  final List<OrderDetails> orders;
  final String message;
  final String status;

  AllOrdersModel({
    required this.orders,
    required this.message,
    required this.status,
  });

  // Factory method to create an Order from a map (used for JSON parsing)
  factory AllOrdersModel.fromJson(Map<String, dynamic> json) {
    return AllOrdersModel(
      orders: (json[ApiKey.orders] as List<dynamic>)
          .map((order) => OrderDetails.fromJson(order))
          .toList(),
      message: json[ApiKey.message],
      status: json[ApiKey.status],
    );
  }
}
