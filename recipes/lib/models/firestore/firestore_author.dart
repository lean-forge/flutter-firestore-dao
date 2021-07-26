import 'package:recipes/models/index.dart';

class FirestoreAuthor extends FirestoreModel<Author> {
  FirestoreAuthor({
    required modelID,
    required model,
  }) : super(
          modelID: modelID,
          model: model,
        );
}
