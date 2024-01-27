import 'package:flutter/material.dart';

class InputFieldContainer extends StatelessWidget {
  final String textLabel;
  const InputFieldContainer({super.key, required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 234, 232, 232),
          borderRadius: BorderRadius.circular(30)),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: TextField(
          decoration: InputDecoration(
            hintText: textLabel,
            hintStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
