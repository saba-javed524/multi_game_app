import 'package:flutter/material.dart';
import 'package:multi_user_app/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, this.buttonText, this.onTap});

  final Function()? onTap;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 70,
        margin: const EdgeInsets.all(25),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xff0f227a),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            buttonText ?? 'Let\'s Go!',
            style: kTextStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
