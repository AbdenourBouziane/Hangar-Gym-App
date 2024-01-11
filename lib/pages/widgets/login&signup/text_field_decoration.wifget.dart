import 'package:flutter/material.dart';

class AppTextFieldDecoration extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordFilled;
  final String? hintText;
  final String? textLabel;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final String? helperText;
  final Widget iconLabel;

  const AppTextFieldDecoration({
    Key? key,
    this.fieldKey,
    this.isPasswordFilled,
    this.hintText,
    this.textLabel,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.helperText,
    required this.iconLabel,
    this.controller,
  }) : super(key: key);

  @override
  State<AppTextFieldDecoration> createState() => _AppTextFieldDecorationState();
}

class _AppTextFieldDecorationState extends State<AppTextFieldDecoration> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      controller: widget.controller,
      obscureText: obscureText, // Set obscureText directly in TextFormField
      decoration: InputDecoration(
        labelText: widget.textLabel,
        icon: widget.iconLabel,
        hintText: widget.hintText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: widget.isPasswordFilled != true
              ? Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: obscureText ? null : Colors.red,
                )
              : null,
        ),
      ),
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.inputType,
    );
  }
}
