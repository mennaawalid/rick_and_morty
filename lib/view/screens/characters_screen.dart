import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/bussiness_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/bussiness_logic/cubit/internet_cubit.dart';

import '../../constants/my_colors.dart';
import '../../data/models/characters.dart';
// import '../../data/repositories/characters_repository.dart';
import '../widgets/build_loaded_list.dart';
import '../widgets/internet_disconnected_widget.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character> allCharacters = [];

  List<Character> searchedCharacters = [];
  final TextEditingController _searchTextFieldController =
      TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    super.initState();
  }

  Widget getTextField() {
    return TextField(
      style: const TextStyle(
        color: MyColors.grey,
      ),
      controller: _searchTextFieldController,
      decoration: InputDecoration(
        hintText: 'Search for a character...',
        hintStyle: TextStyle(
          color: MyColors.grey,
          fontSize: 18.sp,
        ),
      ),
      onChanged: (searchedCharacter) {
        searchedCharacters = allCharacters
            .where(
              (character) =>
                  character.name!.toLowerCase().startsWith(searchedCharacter),
            )
            .toList();
        setState(() {});
      },
    );
  }

  void _clearTextField() {
    _searchTextFieldController.clear();
  }

  void _clearSearch() {
    _clearTextField();
    setState(() {
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearching
          ? AppBar(
              title: getTextField(),
              actions: [
                IconButton(
                  onPressed: () {
                    _clearSearch();
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            )
          : AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                    ModalRoute.of(context)!.addLocalHistoryEntry(
                      LocalHistoryEntry(onRemove: () {
                        _clearSearch();
                      }),
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
              title: const Text(
                'Characters',
              ),
            ),
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, internetState) {
          if (internetState is InternetDisconnected) {
            return const InternetDisconnectedWidet();
          } else {
            return BlocBuilder<CharactersCubit, CharactersState>(
              builder: (context, state) {
                if (state is CharactersLoaded) {
                  allCharacters = state.characters;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        BuildLoadedListWidget(
                          allCharacters:
                              _searchTextFieldController.text.isNotEmpty
                                  ? searchedCharacters
                                  : state.characters,
                        ),
                        if (!isSearching)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: MyColors.greenish,
                                ),
                                onPressed: state.pageInfo.prevPageURrl == null
                                    ? null
                                    : () {
                                        BlocProvider.of<CharactersCubit>(
                                                context)
                                            .changePage(
                                                state.pageInfo.prevPageURrl!);
                                      },
                                child: const Text('Previous Page'),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: MyColors.greenish,
                                ),
                                onPressed: state.pageInfo.nextPageUrl == null
                                    ? null
                                    : () {
                                        BlocProvider.of<CharactersCubit>(
                                                context)
                                            .changePage(
                                                state.pageInfo.nextPageUrl!);
                                      },
                                child: const Text('Next Page'),
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                } else if (state is CharactersNotLoaded) {
                  return const InternetDisconnectedWidet();
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: MyColors.greenish,
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
