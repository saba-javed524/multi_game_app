import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.label,
      required this.hintText,
      this.textEditingController,
      this.inputType});

  TextEditingController? textEditingController = TextEditingController();
  TextInputType? inputType;
  String label;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          label: Text(label),
          hintText: hintText,
        ),
        keyboardType: inputType,
      ),
    );
  }
}
