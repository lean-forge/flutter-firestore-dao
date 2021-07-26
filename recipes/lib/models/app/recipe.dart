import 'package:recipes/models/app/index.dart';

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
