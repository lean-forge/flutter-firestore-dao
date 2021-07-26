import 'package:recipes/models/index.dart';

class FirestoreRecipe extends FirestoreModel<Recipe> {
  FirestoreRecipe({
    required modelID,
    required model,
  }) : super(
          modelID: modelID,
          model: model,
        );
}
