import '../models/characters.dart';
import '../web_services/characters_web_service.dart';

class CharactersRepository {
  Future<List<Character>?> getAllCharacters() async {
    PageInfoAndCharacters pageInfoAndCharacters =
        await CharactersWebServices.getAllCharactersAndPagesInfo();
    return pageInfoAndCharacters.characters;
  }

  Future<Info?> getPageInfo() async {
    PageInfoAndCharacters pageInfoAndCharacters =
        await CharactersWebServices.getAllCharactersAndPagesInfo();
    return pageInfoAndCharacters.pagesInfo;
  }
}
