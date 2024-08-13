import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget {
  CustomTextFormFields({super.key,required this.controller,required this.labelText,this.textInputAction,this.validator,this.keyboardType,this.prefixIcon,this.suffixIcon});

  TextEditingController controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  String? labelText;
  Widget? prefixIcon;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          filled: true,
          border: const OutlineInputBorder(),
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon
      ),
    );
  }
}
