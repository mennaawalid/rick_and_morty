import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';

import '../../constants/strings.dart';
import '../../data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character characterDetails;
  const CharacterItem({
    super.key,
    required this.characterDetails,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: MyColors.greenish,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.of(context)
            .pushNamed(charactersDetailsScreen, arguments: characterDetails);
      },
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: GridTile(
          footer: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              color: const Color.fromARGB(243, 24, 23, 23),
              child: Text(
                characterDetails.name!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.8,
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: Hero(
              tag: characterDetails.characterId!,
              child: Container(
                color: MyColors.grey,
                child: CachedNetworkImage(
                  imageUrl: characterDetails.imageURL!,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: MyColors.greenish),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
