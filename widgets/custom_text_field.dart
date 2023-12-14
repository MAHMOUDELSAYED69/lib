import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.onSaved,
      required this.fieldName,
      this.icon,
      this.validator});
  final void Function(String?)? onSaved;
  final String fieldName;
  final IconData? icon;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ?? (value) {
        if (value!.isEmpty) {
          return "please fill out the field!";
        }
        return null;
      },
      onSaved: onSaved,
      decoration: InputDecoration(
        // hintText: "username",
        label: Text(
          fieldName,
          style: const TextStyle(color: Colors.green),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.green,
        ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        focusedErrorBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
