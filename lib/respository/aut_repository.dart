import 'package:flutter_mvvm_provider/data/network/network_api_services.dart';
import 'package:flutter_mvvm_provider/resources/app_urls.dart';

class AuthRepository {
  NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> rejisterdApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrls.rejisterdEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
