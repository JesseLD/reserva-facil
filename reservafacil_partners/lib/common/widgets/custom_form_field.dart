// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:reservafacil_partners/common/constants/app_input_styles.dart';

class CustomFormField extends StatefulWidget {
  String? labelText;
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  bool obscureText = false;
  Widget? suffixIcon;


  CustomFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: AppInputStyles.primaryInputVariation.copyWith(
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
      ),
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: widget.validator,
    );
  }
}
