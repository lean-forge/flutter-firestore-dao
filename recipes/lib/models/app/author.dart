import 'package:recipes/models/index.dart';

class AuthorMapConverter implements MapConverter<Author> {

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

  const AuthorMapConverter();
}

enum Gender { Female, Male }

class Author extends BaseModel {
  final String name;
  final Gender gender;

  Author({
    required this.name,
    required this.gender,
  });

  // Override necessary to convert ``List<Author>`` to ``Set<Author>``
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Author &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          gender == other.gender;

  @override
  int get hashCode => name.hashCode ^ gender.hashCode;
}
