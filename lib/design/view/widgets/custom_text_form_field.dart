import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.onSubmitted,
      required this.validator,
      this.suffIcon,
      this.prefixIcon,
      this.hintText,
      required this.label,
      this.secure = false,
      this.onPressedSuffixIcon,
      this.keyboardType});
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final IconData? suffIcon;
  final IconData? prefixIcon;
  final Widget? label;

  final bool secure;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function()? onPressedSuffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: secure,
        obscuringCharacter: ".",
        onFieldSubmitted: onSubmitted,
        cursorColor: Colors.blue,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 1, horizontal: 30),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          label: label,
          suffixIcon: IconButton(
            onPressed: onPressedSuffixIcon,
            icon: Icon(
              suffIcon,
              color: Colors.grey,
            ),
            padding: EdgeInsets.zero,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.grey,
          ),
        ));
  }
}
