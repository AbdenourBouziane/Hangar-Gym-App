import 'package:flutter/material.dart';

class AppTextFieldDecoration extends StatelessWidget {
  final String textLabel;
  final Widget iconLabel;
  const AppTextFieldDecoration({
    super.key,
    required this.textLabel,
    required this.iconLabel,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: textLabel,
        icon: iconLabel,
      ),
    );
  }
}
