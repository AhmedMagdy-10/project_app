import 'package:flutter/material.dart';
import 'package:project_app/constants/icon_broken.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.sendOnPressed, this.hintText, this.controller});

  final void Function()? sendOnPressed;
  final String? hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        cursorColor: Colors.blue,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: const Icon(
            IconBroken.Message,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
