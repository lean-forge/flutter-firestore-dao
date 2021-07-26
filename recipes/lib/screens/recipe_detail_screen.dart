import 'package:flutter/material.dart';
import 'package:recipes/models/index.dart';

class RecipeDetailScreen extends StatelessWidget {
  static final String routeName = 'recipe-detail';
  late Recipe recipe;

  Widget _buildRecipeImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      child: Image.network(
        recipe.imageUrl,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildAuthorInfoWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Recipe by ${recipe.author.name}',
            style: Theme.of(context).textTheme.headline6,
          ),
          Icon(
              recipe.author.gender == Gender.Female ? Icons.female : Icons.male)
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget _buildContainer(
    BuildContext context,
    Widget child, {
    double height = 250,
    double width = 350,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(7.5),
      padding: EdgeInsets.all(10),
      height: height,
      width: width,
      child: child,
    );
  }

  Widget _buildCard(BuildContext context, Widget child) {
    return Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: child,
        ));
  }

  Widget _buildIngredientsListView(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => _buildCard(
        context,
        Text(recipe.ingredients[index]),
      ),
      itemCount: recipe.ingredients.length,
    );
  }

  List<String> _instructionList() => recipe.instructions.split('. ');

  Widget _buildInstructionsListView(BuildContext context) {
    final instructionList = _instructionList();
    return ListView.builder(
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('# ${(index + 1)}'),
            ),
            title: _buildCard(context, Text(instructionList[index])),
          ),
          Divider()
        ],
      ),
      itemCount: instructionList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            recipe.title,
            overflow: TextOverflow.fade,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildRecipeImage(),
              _buildAuthorInfoWidget(context),
              _buildSectionTitle(context, 'Ingredients'),
              _buildContainer(
                context,
                _buildIngredientsListView(context),
                height: 300,
              ),
              _buildSectionTitle(context, 'Instructions'),
              _buildContainer(
                context,
                _buildInstructionsListView(context),
                height: 400,
              ),
            ],
          ),
        ));
  }
}
