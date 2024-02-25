import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/respository/aut_repository.dart';
import 'package:flutter_mvvm_provider/utilis/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/utilis/utilis.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool _signLoading = false;
  bool get loading => _loading;
  bool get signLoading => _signLoading;

  final _myrepo = AuthRepository();
  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setsignuploading(bool signvalue) {
    _signLoading = signvalue;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setloading(true);
    _myrepo.loginApi(data).then((value) {
      Utils.toastMessage("Login SuccessFully");
      notifyListeners();
      Navigator.pushNamed(context, Routesname.home);
      setloading(false);
    }).onError((error, stackTrace) {
      setloading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setsignuploading(true);
    _myrepo.rejisterdApi(data).then((value) {
      setsignuploading(false);
      Utils.flushBarErrorMessage("Rejisterd SuccessFully", context);
      Navigator.pushNamed(context, Routesname.home);
    }).onError((error, stackTrace) {
      setsignuploading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
