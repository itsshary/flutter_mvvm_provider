import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/resources/componets/round_button.dart';
import 'package:flutter_mvvm_provider/utilis/utilis.dart';
import 'package:flutter_mvvm_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  FocusNode emailnode = FocusNode();
  FocusNode passwordnode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    emailC.dispose();
    passwordC.dispose();
    _obsecurePassword.dispose();
    emailnode.dispose();
    passwordnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("SigUp"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            focusNode: emailnode,
            controller: emailC,
            decoration: const InputDecoration(
              hintText: "Enter Email",
              prefixIcon: Icon(Icons.email),
            ),

            //used for focus node
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(context, emailnode, passwordnode);
              //  FocusScope.of(context).requestFocus(passwordnode);
            },
          ),
          const SizedBox(
            height: 15.0,
          ),
          ValueListenableBuilder(
            valueListenable: _obsecurePassword,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: _obsecurePassword.value,
                controller: passwordC,
                focusNode: passwordnode,
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(_obsecurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility))),
              );
            },
          ),
          RoundButton(
            onpress: () {
              //you can handle more exceptions using if else like lengnt of password
              if (emailC.text.isEmpty) {
                Utils.flushBarErrorMessage("Enter Email", context);
              } else if (passwordC.text.isEmpty) {
                Utils.flushBarErrorMessage("Enter Password", context);
              } else if (passwordC.text.length < 6) {
                Utils.flushBarErrorMessage(
                    "Enter Password 6 Character", context);
              } else {
                Map data = {
                  "email": emailC.text.toString(),
                  "password": passwordC.text.toString()
                };
                authViewModel.signUpApi(data, context);
              }
            },
            title: "Signup",
            loading: authViewModel.signLoading,
          ),
        ],
      ),
    );
  }
}
