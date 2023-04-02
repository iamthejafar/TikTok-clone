import 'package:flutter/material.dart';
import 'package:tiktokclone/constants.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({Key? key, required this.controller, required this.labelText, this.isObsecure = false, required this.icon}) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool isObsecure;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObsecure,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 20),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color: kborderColor
            )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: kborderColor
          )
        ),

      ),
    );
  }
}
