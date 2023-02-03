// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersNotLoaded extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  final Info pageInfo;

  CharactersLoaded({
    required this.characters,
    required this.pageInfo,
  });
}
