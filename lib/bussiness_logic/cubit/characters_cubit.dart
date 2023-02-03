import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/repositories/characters_repository.dart';

import '../../data/models/characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  // late final List<Character> characters;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  void changePage(String url) {
    emit(
      CharactersLoading(),
    );
    charactersRepository.getPageInfo(url).then(
          (info) =>
              charactersRepository.getAllCharacters(url).then((characters) {
            emit(CharactersLoaded(pageInfo: info, characters: characters));
            // this.characters = characters;
          }),
        );
  }

  void getAllCharacters() {
    charactersRepository
        .getPageInfo('https://rickandmortyapi.com/api/character')
        .then(
          (info) => charactersRepository
              .getAllCharacters('https://rickandmortyapi.com/api/character')
              .then((characters) {
            emit(CharactersLoaded(pageInfo: info, characters: characters));
            // this.characters = characters;
          }),
        );

    // return characters;
  }
}
