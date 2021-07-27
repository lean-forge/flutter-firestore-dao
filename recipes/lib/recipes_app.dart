import 'package:flutter/material.dart';
import 'package:recipes/screens/index.dart';

final Color darkBlue = Color.fromARGB(255, 40, 69, 97);

class RecipesApp extends StatelessWidget {
  const RecipesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      initialRoute: RecipesScreen.routeName,
      routes: {
        RecipesScreen.routeName: (ctx) => RecipesScreen(),
        RecipeDetailScreen.routeName: (ctx) => RecipeDetailScreen()
      },
    );
  }
}
