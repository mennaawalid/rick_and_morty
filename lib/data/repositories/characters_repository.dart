import '../models/characters.dart';
import '../web_services/characters_web_service.dart';

class CharactersRepository {
 Future<List<Character>> getAllCharacters(String url) async {
    final characters =
        await CharactersWebServices.getAllCharactersAndPagesInfo(url);
    final data = PageInfoAndCharacters.fromJson(characters);
    return data.characters!;
  }

  Future<Info> getPageInfo(String url) async {
    final characters =
        await CharactersWebServices.getAllCharactersAndPagesInfo(url);

    final data = PageInfoAndCharacters.fromJson(characters);
    return data.pagesInfo!;
  }
}
