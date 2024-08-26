import 'package:flutter/material.dart';

//this is the custom text form field widget that will be used in the login and registration views to create the text fields for the user to input their data in the form fields  this class returns a text form field widget that takes in the following parameters   controller, labelText, obscureText, validator, enableSuggestions, autocorrect, keyboardType.

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextInputType keyboardType;

  const CustomTextFormField({
    required this.controller,
    required this.labelText,
    required this.obscureText,
    this.validator,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: obscureText!,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
