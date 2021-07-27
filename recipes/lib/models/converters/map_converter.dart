import 'package:recipes/models/app/index.dart';
import 'package:recipes/models/firestore/firestore_author.dart';
import 'package:recipes/models/firestore/firestore_recipe.dart';

/// Global static utility class with the responsibility of associating
/// supported [Type]s with a single instance
/// of their [MapConverter] implementation.
class MapConverters {
  /// A [Map] to associate model [Type]s with their [MapConverter].
  ///
  /// Whenever a new [MapConverter] is implemented for a [Type], only this
  /// [Map] needs to be edited. Then the [MapConverter] will be accessible
  /// through the [Converters] facade as:
  ///
  /// ```dart
  /// Converters.mapConverter<Recipe>();
  /// ```
  static final Map<Type, MapConverter> _mapConverterMap = {
    Author: AuthorMapConverter(),
    Recipe: RecipeMapConverter(),
    FirestoreAuthor: FirestoreAuthorMapConverter(),
    FirestoreRecipe: FirestoreRecipeMapConverter(),
  };

  /// Returns the [MapConverter] instance associated with the subtype [T].
  static MapConverter<T> mapConverter<T>() {
    return _mapConverterMap[T] as MapConverter<T>;
  }
}

/// Interface to be used for converting in-app model classes to
/// JSON-like [Map] objects and vice-versa.
abstract class MapConverter<T> {
  /// Converts the supplied [model] into a JSON-like [Map]
  Map<String, Object?> toMap(T model);

  /// Converts the supplied JSON-like [Map] into a model object of type [T]
  T fromMap(Map<String, Object?> json);
}
