import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utilis/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScree extends StatefulWidget {
  const HomeScree({super.key});

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                userprovider.remove().then((value) {
                  Navigator.pushReplacementNamed(context, Routesname.login);
                });
              },
              child: Text("Logout",
                  style: Theme.of(context).textTheme.headlineLarge),
            )
          ],
        ),
      ),
    );
  }
}
