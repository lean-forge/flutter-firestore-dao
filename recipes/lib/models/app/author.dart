import 'package:recipes/models/index.dart';

class AuthorMapConverter extends MapConverter<Author> {
  @override
  Author fromMap(Map<String, Object?> json) {
    final name = json['name'] as String;
    final genderString = json['gender'] as String;
    final gender = genderString == 'female' ? Gender.Female : Gender.Male;
    return Author(name: name, gender: gender);
  }

  @override
  Map<String, Object?> toMap(Author model) {
    final genderString = model.gender == Gender.Female ? 'female' : 'male';
    return {'name': model.name, 'gender': genderString};
  }
}

enum Gender { Female, Male }

class Author extends BaseModel {
  final String name;
  final Gender gender;

  Author({
    required this.name,
    required this.gender,
  });
}
