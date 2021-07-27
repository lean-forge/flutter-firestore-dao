import 'package:recipes/models/index.dart';
import 'package:recipes/services/index.dart';

class FirestoreRecipeDao extends FirestoreDao<Recipe> {
  @override
  Future<Recipe?> getByPath(String path) {
    return FirestoreUtils.modelFuture<Recipe, FirestoreRecipe>(path);
  }

  @override
  Stream<List<Recipe>> modelStream() {
    return FirestoreUtils.modelStream<Recipe, FirestoreRecipe>();
  }

  @override
  Future<void> write(Recipe model, {Map<String, Object>? auxMap}) {
    // TODO: implement write
    throw UnimplementedError();
  }

}