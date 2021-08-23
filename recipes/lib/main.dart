import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipes/recipes_app.dart';

Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RecipesApp();
  }
}
