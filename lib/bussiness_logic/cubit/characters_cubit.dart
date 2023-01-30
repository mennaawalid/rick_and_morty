import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/repositories/characters_repository.dart';

import '../../data/models/characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  late final List<Character> characters;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
