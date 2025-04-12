import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

enum FormStyle { filled, outlined }

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;
  final String? labelText;
  final FormStyle style;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final double borderRadius;
  final int maxLines;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool obscureText;

  const FormInput({
    super.key,
    required this.controller,
    this.labelText,
    this.style = FormStyle.filled,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.borderRadius = 16.0,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.validator,
    this.onTap,
    this.obscureText = false, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      validator: validator,
      onTap: onTap,
      obscureText: obscureText,
      cursorColor: DefaultColors.primaryBlue,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
