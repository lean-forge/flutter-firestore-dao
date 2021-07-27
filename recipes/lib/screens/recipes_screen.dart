import 'package:flutter/material.dart';
import 'package:recipes/models/index.dart';
import 'package:recipes/services/firestore/firestore_dao.dart';
import 'package:recipes/widgets/index.dart';

class RecipesScreen extends StatelessWidget {
  static final String routeName = 'recipes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recipes'),
        ),
        body: StreamBuilder(
          stream: FirestoreDao.of<Recipe>().modelStream(),
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error'),);
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator(),);
            }
            final recipes = snapshot.data as List<Recipe>;
            return ListView.builder(
              itemBuilder: (ctx, idx) => RecipeItem(recipe: recipes[idx]),
              itemCount: recipes.length,
            );
          },
        ));
  }
}
