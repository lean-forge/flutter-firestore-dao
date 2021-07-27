import 'package:recipes/models/app/index.dart';
import 'package:recipes/models/converters/index.dart';

class RecipeMapConverter extends MapConverter<Recipe> {
  /// Reuse the conversion logic for ``Author``, defined in ``AuthorMapConverter``
  final _authorMapConverter = AuthorMapConverter();

  List<String> _parseStringList(List<dynamic> list) {
    return list.map((item) => item as String).toList();
  }

  double _parseDouble(Object number) {
    if (number.runtimeType == int) {
      return (number as int).toDouble();
    }
    if (number.runtimeType == String) {
      return double.parse(number as String);
    }
    if (number.runtimeType == double) {
      return number as double;
    }
    return 0.0;
  }

  @override
  Recipe fromMap(Map<String, Object?> json) {
    return Recipe(
        title: json['title'] as String,
        author:
            _authorMapConverter.fromMap(json['author'] as Map<String, Object?>),
        totalTime: json['total_time'] as int,
        yields: json['yields'] as String,
        imageUrl: json['image'] as String,
        ingredients: _parseStringList(json['ingredients'] as List),
        instructions: json['instructions'] as String,
        ratings: _parseDouble(json['ratings']!));
  }

  @override
  Map<String, Object?> toMap(Recipe model) {
    return {
      'title': model.title,
      'author': _authorMapConverter.toMap(model.author),
      'totalTime': model.totalTime,
      'yields': model.yields,
      'imageUrl': model.imageUrl,
      'ingredients': model.ingredients,
      'instructions': model.instructions,
      'ratings': model.ratings,
    };
  }
}

class Recipe extends BaseModel {
  final String title;
  final Author author;
  final int totalTime;
  final String yields;
  final String imageUrl;
  final List<String> ingredients;
  final String instructions;
  final double ratings;

  Recipe({
    required this.title,
    required this.author,
    required this.totalTime,
    required this.yields,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
    required this.ratings,
  });
}
