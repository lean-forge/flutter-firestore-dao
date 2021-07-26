import 'package:recipes/models/app/index.dart';
import 'package:recipes/models/converters/index.dart';

class RecipeMapConverter extends MapConverter<Recipe> {
  /// Reuse the conversion logic for ``Author``, defined in ``AuthorMapConverter``
  final _authorMapConverter = Converters.mapConverter<Author>();

  @override
  Recipe fromMap(Map<String, Object?> json) {
    return Recipe(
        title: json['title'] as String,
        author:
            _authorMapConverter.fromMap(json['author'] as Map<String, Object?>),
        totalTime: json['totalTime'] as int,
        yields: json['yields'] as String,
        imageUrl: json['imageUrl'] as String,
        ingredients: json['ingredients'] as List<String>,
        instructions: json['instructions'] as String,
        ratings: json['ratings'] as double);
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
