import 'package:recipes/models/index.dart';

class FirestoreAuthorMapConverter extends MapConverter<FirestoreAuthor> {
  /// Reuse the conversion logic for ``Author``, defined in ``AuthorMapConverter``
  final _authorMapConverter = AuthorMapConverter();
  @override
  FirestoreAuthor fromMap(Map<String, Object?> json) {
    final modelID = json['recipeID'] as String;
    final model = _authorMapConverter.fromMap(json);
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
