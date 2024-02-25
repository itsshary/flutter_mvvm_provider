import 'package:flutter_mvvm_provider/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse({this.data, this.message, this.status});

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String tostring() {
    return "status: $status \n message : $message \n data: $data";
  }
}
