class PageInfoAndCharacters {
  Info? pagesInfo;
  List<Character>? characters;

  PageInfoAndCharacters.fromJson(Map<String, dynamic> json) {
    pagesInfo = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      characters = <Character>[];
      json['results'].forEach((v) {
        characters!.add(Character.fromJson(v));
      });
    }
  }
}

class Info {
  int? charactersCountInPage;
  int? totalPages;
  String? nextPageUrl;
  String? prevPageURrl;

  Info.fromJson(Map<String, dynamic> json) {
    charactersCountInPage = json['count'];
    totalPages = json['pages'];
    nextPageUrl = json['next'];
    prevPageURrl = json['prev'];
  }
}

class Character {
  int? characterId;
  String? name;
  String? statusDeadOrALive;
  String? species;
  String? type;
  String? gender;
  Map<String, String>? originNameAndURL;
  Map<String, String>? locationNameAndURL;
  String? imageURL;
  List<String>? episodeURL;
  String? characterUrl;
  String? creationDate;

  Character.fromJson(Map<String, dynamic> json) {
    characterId = json['id'];
    name = json['name'];
    statusDeadOrALive = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    originNameAndURL = json['origin'];
    locationNameAndURL = json['location'];
    imageURL = json['image'];
    episodeURL = json['episode'];
    characterUrl = json['url'];
    creationDate = json['created'];
  }
}
