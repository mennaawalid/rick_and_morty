import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/repositories/characters_repository.dart';

import '../../data/models/characters.dart';
import 'internet_cubit.dart';
// import 'internet_cubit.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  final InternetCubit internetCubit;
//  late StreamSubscription internetStreamSubscription;
  CharactersCubit(this.charactersRepository, this.internetCubit)
      : super(CharactersInitial()) {
    // internetStreamSubscription =
    //     internetCubit.stream.listen((connectivityStateResult) {
    //   if (connectivityStateResult is InternetConnected) {
    //     getAllCharacters();
    //   } else if (connectivityStateResult is InternetDisconnected) {
    //     emit(
    //       CharactersNotLoaded(),
    //     );
    //   } else {
    //     emit(
    //       CharactersLoading(),
    //     );
    //   }
    // });
  }

  void changePage(String url) {
    emit(
      CharactersLoading(),
    );
    charactersRepository.getPageInfo(url).then((info) {
      charactersRepository.getAllCharacters(url).then((characters) {
        emit(
          CharactersLoaded(
            pageInfo: info,
            characters: characters,
          ),
        );
      });
    });
  }

  void getAllCharacters() {
    charactersRepository
        .getPageInfo('https://rickandmortyapi.com/api/character')
        .then(
          (info) => charactersRepository
              .getAllCharacters('https://rickandmortyapi.com/api/character')
              .then((characters) {
            emit(
              CharactersLoaded(
                pageInfo: info,
                characters: characters,
              ),
            );
          }),
        );
  }

  // @override
  // Future<void> close() {
  //   internetStreamSubscription.cancel();
  //   return super.close();
  // }
}
