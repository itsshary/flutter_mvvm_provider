import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utilis/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view/home_screen.dart';
import 'package:flutter_mvvm_provider/view/logi_view.dart';
import 'package:flutter_mvvm_provider/view/signup_view.dart';
import 'package:flutter_mvvm_provider/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case Routesname.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScree());
      case Routesname.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case Routesname.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No Routes Defines"),
                  ),
                ));
    }
  }
}
