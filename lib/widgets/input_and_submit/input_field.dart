import 'package:flutter/material.dart';

import '../../config/palette.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hintColor,
  });

  final TextEditingController? controller;
  final String hintText;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 18),
      maxLength: 20,
      decoration: InputDecoration(
        filled: true,
        fillColor: Palette.textFieldColor,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        // border: ,
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        suffixIcon: IconButton(
          onPressed: () {
            if (controller != null) {
              controller!.clear();
            }
          },
          icon: const Icon(Icons.clear_rounded),
        ),
      ),
    );
  }
}
