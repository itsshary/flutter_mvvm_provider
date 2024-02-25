import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onpress,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.buttoncolor,
            borderRadius: BorderRadius.circular(20.0)),
        child: loading
            ? const CircularProgressIndicator()
            : Center(
                child: Text(
                title,
                style: const TextStyle(
                    fontSize: 20.0, color: AppColors.blackcolor),
              )),
      ),
    );
  }
}
