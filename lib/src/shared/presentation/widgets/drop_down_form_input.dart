import 'package:flutter/material.dart';
import 'package:flutter_dermascan/src/core/utils/theme.dart';

class DropDownFormInput extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final String hintText;
  final ValueChanged onChanged;
  final FormFieldValidator validator;

  const DropDownFormInput({
    super.key,
    required this.items,
    required this.hintText,
    required this.onChanged,
    required this.validator,
  });

  @override
  State<DropDownFormInput> createState() => _DropDownFormInputState();
}

class _DropDownFormInputState extends State<DropDownFormInput> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: null,
      items:
          widget.items.map((e) {
            return DropdownMenuItem(
              value: e['value'],
              child: Text(
                e['label']!,
                style: TextStyle(
                  fontSize: FontSize.standardUp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
      onChanged: widget.onChanged,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        size: 32,
        color: DefaultColors.grey,
      ),
      hint: Text(
        widget.hintText,
        style: TextStyle(
          fontSize: FontSize.standardUp,
          color: DefaultColors.lightGrey,
        ),
      ),
      dropdownColor: DefaultColors.white,
      validator:widget.validator ,
    );
  }
}
