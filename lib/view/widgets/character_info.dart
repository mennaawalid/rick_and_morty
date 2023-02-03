import 'package:flutter/material.dart';

class CharacterInfo extends StatelessWidget {
  final String title;
  final String value;
  const CharacterInfo({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: value,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ]),
    );
  }
}
