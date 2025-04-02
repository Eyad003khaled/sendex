
import '../api/endpoints.dart';

class ErrorModel {
  final bool status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
        status: jsonData[ApiKey.status], errorMessage: ApiKey.message);
  }
}


