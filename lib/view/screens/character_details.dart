import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../data/models/characters.dart';
import '../widgets/character_info.dart';
import '../widgets/divider.dart';

class CharactersDetails extends StatelessWidget {
  final Character selectedCharacter;
  const CharactersDetails({super.key, required this.selectedCharacter});

  List<String> get episodes {
    List<String> episodes = [];
    for (String v in selectedCharacter.episodeURL!) {
      v = v.substring(40);
      episodes.add(v);
    }
    return episodes;
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                selectedCharacter.name!,
                style: const TextStyle(
                  color: MyColors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Hero(
                tag: selectedCharacter.characterId!,
                child: CachedNetworkImage(
                  imageUrl: selectedCharacter.imageURL!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.all(screenwidth * 0.035),
                  padding: EdgeInsets.all(screenwidth * 0.035),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(
                        value: selectedCharacter.species!,
                        title: 'Species : ',
                      ),
                      BuildDivider(
                        endIndent: screenwidth * 0.69,
                      ),
                      if (selectedCharacter.type!.isNotEmpty)
                        CharacterInfo(
                          value: selectedCharacter.type!,
                          title: 'Type : ',
                        ),
                      if (selectedCharacter.type!.isNotEmpty)
                        BuildDivider(
                          endIndent: screenwidth * 0.75,
                        ),
                      CharacterInfo(
                        value: selectedCharacter.originNameAndURL!['name']!,
                        title: 'Origin : ',
                      ),
                      BuildDivider(
                        endIndent: screenwidth * 0.72,
                      ),
                      CharacterInfo(
                        value: selectedCharacter.locationNameAndURL!['name']!,
                        title: 'Location : ',
                      ),
                      BuildDivider(
                        endIndent: screenwidth * 0.66,
                      ),
                      CharacterInfo(
                        value: selectedCharacter.creationDate!.substring(0, 10),
                        title: 'Created : ',
                      ),
                      BuildDivider(
                        endIndent: screenwidth * 0.69,
                      ),
                      CharacterInfo(
                        value: selectedCharacter.statusDeadOrALive!,
                        title: 'Status : ',
                      ),
                      BuildDivider(
                        endIndent: screenwidth * 0.72,
                      ),
                      CharacterInfo(
                        value: selectedCharacter.gender!,
                        title: 'Gender : ',
                      ),
                      BuildDivider(
                        endIndent: screenwidth * 0.72,
                      ),
                      CharacterInfo(
                        value: episodes.join(' / '),
                        title: 'Episodes : ',
                      ),
                      BuildDivider(
                        endIndent: screenwidth * 0.656,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
