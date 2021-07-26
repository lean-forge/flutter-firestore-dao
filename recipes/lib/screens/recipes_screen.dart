import 'package:flutter/material.dart';
import 'package:recipes/models/dummy_recipes.dart';
import 'package:recipes/widgets/index.dart';

class RecipesScreen extends StatelessWidget {
  static final String routeName = 'recipes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recipes'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, idx) => RecipeItem(recipe: DUMMY_RECIPES[idx]),
          itemCount: DUMMY_RECIPES.length,
        ));
  }
}
