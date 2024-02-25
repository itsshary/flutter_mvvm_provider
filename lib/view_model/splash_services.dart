import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/model/user_model.dart';
import 'package:flutter_mvvm_provider/utilis/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getuserdata() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) {
    getuserdata().then((value) async {
      if (value.token == "null" || value.token == "") {
        Navigator.pushNamed(context, Routesname.login);
        await Future.delayed(const Duration(seconds: 5));
      } else {
        Navigator.pushNamed(context, Routesname.home);
        await Future.delayed(const Duration(seconds: 5));
      }
    });
  }
}
