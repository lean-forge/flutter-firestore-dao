import 'package:recipes/models/index.dart';

enum Gender { Female, Male }

class Author extends BaseModel {
  final String name;
  final Gender gender;

  Author({
    required this.name,
    required this.gender,
  });
}
