import '../models/characters.dart';
import '../web_services/characters_web_service.dart';

class CharactersRepository {
 Future<List<Character>> getAllCharacters() async {
    final characters =
        await CharactersWebServices.getAllCharactersAndPagesInfo();
    final data = PageInfoAndCharacters.fromJson(characters);
    return data.characters!;
  }

  Future<Info?> getPageInfo() async {
    final characters =
        await CharactersWebServices.getAllCharactersAndPagesInfo();

    final data = PageInfoAndCharacters.fromJson(characters);
    return data.pagesInfo;
  }
}
