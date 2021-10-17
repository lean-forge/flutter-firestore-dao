import 'package:recipes/models/index.dart';

class FirestoreUserPreferenceMapConverter
    implements MapConverter<FirestoreUserPreference> {
  const FirestoreUserPreferenceMapConverter();

  /// Reuse the conversion logic for ``UserPreference``, defined in ``UserPreferenceMapConverter``
  static const _userPreferenceMapConverter = UserPreferenceMapConverter();

  @override
  FirestoreUserPreference fromMap(Map<String, Object?> json) {
    final modelID = json['userPreferenceID'] as String;
    final model = _userPreferenceMapConverter.fromMap(json);
    return FirestoreUserPreference(modelID: modelID, model: model);
  }

  @override
  Map<String, Object?> toMap(FirestoreUserPreference model) {
    return {
      'userPreferenceID': model.modelID,
      ..._userPreferenceMapConverter.toMap(model.model)
    };
  }
}

class FirestoreUserPreference extends FirestoreModel<UserPreference> {
  FirestoreUserPreference({
    required modelID,
    required model,
  }) : super(
          modelID: modelID,
          model: model,
        );
}
