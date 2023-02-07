import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';

class BuildDivider extends StatelessWidget {
  final double endIndent;
  const BuildDivider({super.key, required this.endIndent});

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: endIndent,
      height: MediaQuery.of(context).size.height * 0.05,
      color: MyColors.greenish,
      thickness: MediaQuery.of(context).size.height * 0.006,
    );
  }
}
