import 'package:flutter/material.dart';

import '/app_router.dart';
import 'constants/strings.dart';

void main() {
  runApp(const RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: charactersScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
