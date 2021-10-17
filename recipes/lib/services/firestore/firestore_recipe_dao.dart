import 'package:recipes/models/index.dart';
import 'package:recipes/services/index.dart';

class FirestoreRecipeDao extends FirestoreDao<Recipe> {
  @override
  Stream<List<Recipe>> modelStream() {
    return FirestoreUtils.modelStream<Recipe, FirestoreRecipe>();
  }

  @override
  void write(Recipe model) {
    throw UnimplementedError();
  }
}
