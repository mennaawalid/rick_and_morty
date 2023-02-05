import 'package:flutter/material.dart';

import 'constants/strings.dart';
import 'data/models/characters.dart';
import 'view/screens/character_details.dart';
import 'view/screens/characters_screen.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const CharactersScreen();
          },
        );

      case charactersDetailsScreen:
        final Character selectedCharacter = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) {
            return CharactersDetails(
              selectedCharacter: selectedCharacter,
            );
          },
        );
      default:
        _errorRoute();
    }
    return null;
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('PAGE NOT FOUND!'),
        ),
      );
    });
  }
}
