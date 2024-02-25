import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm_provider/data/network/base_api_Services.dart';
import 'package:flutter_mvvm_provider/data/network_exception.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      //on socketexception is an internet exception
      throw FetchDataExceptions("No Internet Connection");
    }
    return responseJson;
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      //on socketexception is an internet exception
      throw FetchDataExceptions("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = jsonDecode(response.body);
        return responsejson;
//another type exception with status code 400
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 500:
        throw InvalidinputException(response.statusCode.toString());
      default:
        throw FetchDataExceptions(
            // ignore: prefer_adjacent_string_concatenation
            "Error Occured While communicating with Server" +
                "With status code" +
                response.statusCode.toString());
    }
  }
}
