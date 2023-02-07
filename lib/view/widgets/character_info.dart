import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
      ]),
    );
  }
}
