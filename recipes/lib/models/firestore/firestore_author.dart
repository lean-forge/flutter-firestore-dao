import 'package:recipes/models/index.dart';

class FirestoreAuthorMapConverter implements MapConverter<FirestoreAuthor> {
  const FirestoreAuthorMapConverter();

  /// Reuse the conversion logic for ``Author``, defined in ``AuthorMapConverter``
  static const _authorMapConverter = AuthorMapConverter();
  @override
  FirestoreAuthor fromMap(Map<String, Object?> json) {
    final modelID = json['recipeID'] as String;
    final model = _authorMapConverter.fromMap(json['author'] as Map<String, Object?>);
    return FirestoreAuthor(modelID: modelID, model: model);
  }

  @override
  Map<String, Object?> toMap(FirestoreAuthor model) {
    return _authorMapConverter.toMap(model.model);
  }

}

class FirestoreAuthor extends FirestoreModel<Author> {
  FirestoreAuthor({
    required modelID,
    required model,
  }) : super(
          modelID: modelID,
          model: model,
        );
}
