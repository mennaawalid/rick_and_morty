import 'package:flutter/material.dart';

import '../../data/models/characters.dart';
import 'character_item.dart';

class BuildLoadedListWidget extends StatelessWidget {
  final List<Character> allCharacters;
  const BuildLoadedListWidget({super.key, required this.allCharacters});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth > 550 ? 3 : 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return CharacterItem(
          characterDetails: allCharacters[index],
        );
      },
      itemCount: allCharacters.length,
    );
  }
}
