// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool obscureText;
  final Icon? suffixIcon;
  final Color? suffixIconColor;
  final Icon? prefixIcon;
  final Color? prefixIconColor;
  final TextEditingController? controller;

  const MyTextField({
    super.key,
    required this.label,
    this.hintText,
    this.suffixIcon,
    this.suffixIconColor,
    this.prefixIcon,
    this.prefixIconColor,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface.withAlpha(50),
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
