import 'package:flutter/material.dart';
import 'package:recipes/models/app/index.dart';
import 'package:recipes/screens/index.dart';
import 'package:recipes/services/firestore/firestore_dao.dart';

final Color defaultPrimaryColor = Colors.teal;
final Color darkBlue = const Color.fromARGB(255, 40, 69, 97);

class RecipesApp extends StatelessWidget {
  const RecipesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserPreference>>(
        stream: FirestoreDao.of<UserPreference>().modelStream(),
        builder: (context, snapshot) {
          final preferences = snapshot.data ?? <UserPreference>[];
          preferences.sort((a, b) => a.dateModified.compareTo(b.dateModified));
          final primaryColor = preferences.isNotEmpty
              ? preferences.last.appPrimaryColor
              : defaultPrimaryColor;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Recipes',
            theme: ThemeData.dark().copyWith(
              primaryColor: primaryColor,
              primaryColorDark: primaryColor,
              scaffoldBackgroundColor: darkBlue,
              appBarTheme: AppBarTheme(backgroundColor: primaryColor),
              cardTheme: CardTheme(color: primaryColor),
            ),
            initialRoute: RecipesScreen.routeName,
            routes: {
              RecipesScreen.routeName: (ctx) => RecipesScreen(),
              RecipeDetailScreen.routeName: (ctx) => RecipeDetailScreen(),
              AuthorsScreen.routeName: (ctx) => AuthorsScreen(),
            },
          );
        });
  }
}
