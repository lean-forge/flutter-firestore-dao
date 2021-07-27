import 'package:recipes/models/index.dart';

class FirestoreRecipeMapConverter extends MapConverter<FirestoreRecipe> {
  /// Reuse the conversion logic for ``Recipe``, defined in ``RecipeMapConverter``
  final _recipeMapConverter = RecipeMapConverter();
  @override
  FirestoreRecipe fromMap(Map<String, Object?> json) {
    final modelID = json['recipeID'] as String;
    final model = _recipeMapConverter.fromMap(json);
    return FirestoreRecipe(modelID: modelID, model: model);
  }

  @override
  Map<String, Object?> toMap(FirestoreRecipe model) {
    return {
      'recipeID': model.modelID,
      ..._recipeMapConverter.toMap(model.model)
    };
  }

}

class FirestoreRecipe extends FirestoreModel<Recipe> {
  FirestoreRecipe({
    required modelID,
    required model,
  }) : super(
          modelID: modelID,
          model: model,
        );
}
