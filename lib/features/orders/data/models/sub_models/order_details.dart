import 'package:sendex_test/core/api/endpoints.dart';
import 'package:sendex_test/features/orders/domain/entities/orders_entity.dart';

class OrderDetails extends OrdersEntity {


  OrderDetails({
    required super.clientName,
    required super.address,
    required super.status,
  });

  // Factory method to create an Order from a map (used for JSON parsing)
  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      clientName: json[ApiKey.clientName],
      address: json[ApiKey.address],
      status: json[ApiKey.status],
    );
  }
}
