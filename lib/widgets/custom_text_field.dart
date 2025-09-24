import 'package:flutter/material.dart';
import 'package:job_ghar/core/constant/app_color.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String labelText,
  required IconData icon,
  bool obscureText = false,
  Widget? suffixIcon,
  String? Function(String?)? validator,
}) {
  return Container(
    margin: EdgeInsets.only(top: 25),
    child: TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 15, color: AppColor.secondary),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        prefixIcon: Icon(icon),
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 15, color: AppColor.secondary),
        floatingLabelStyle: const TextStyle(
          fontSize: 15,
          color: AppColor.secondary,
        ),
        filled: true,
        fillColor: AppColor.primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.inactive),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.secondary),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primaryRed, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColor.primaryRed),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: suffixIcon,
      ),
    ),
  );
}