import 'package:flutter/material.dart';
import 'package:recipes/models/index.dart';
import 'package:recipes/screens/authors_screen.dart';
import 'package:recipes/services/index.dart';
import 'package:recipes/widgets/index.dart';

class RecipesScreen extends StatelessWidget {
  static final String routeName = 'recipes';

  Widget _buildRecipeList() {
    return StreamBuilder(
      stream: FirestoreDao.of<Recipe>().modelStream(),
      builder: (ctx, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text('Error'),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final recipes = snapshot.data as List<Recipe>;
        return ListView.builder(
          itemBuilder: (ctx, idx) => RecipeItem(recipe: recipes[idx]),
          itemCount: recipes.length,
        );
      },
    );
  }

  Widget _buildAuthorsScreenIconButton(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pushNamed(
              AuthorsScreen.routeName,
            ),
        icon: Icon(Icons.account_circle_outlined));
  }

  Widget _buildUserPreferencesIconButton(BuildContext context) {
    return IconButton(
        onPressed: () => showDialog(
              context: context,
              builder: (ctx) => ColorPickerDialog(),
            ),
        icon: Icon(Icons.color_lens_outlined));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        actions: [
          _buildAuthorsScreenIconButton(context),
          _buildUserPreferencesIconButton(context),
        ],
      ),
      // Loading Recipe data from the DAO
      body: _buildRecipeList(),
    );
  }
}
