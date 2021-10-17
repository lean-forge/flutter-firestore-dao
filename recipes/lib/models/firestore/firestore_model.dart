import 'package:recipes/models/index.dart';

/// Used to create [FirestoreModel] objects dynamically based on a type parameter
/// when calling [FirestoreModel.from].
final Map<Type, dynamic> _firestoreWrapperModelMap = {
  UserPreference: (
    String modelID,
    Object model,
  ) =>
      FirestoreUserPreference(
        modelID: modelID,
        model: model as UserPreference,
      ),
};

/// Interface to wrap [BaseModel] child classes of type [T] that shall be
/// persisted to Firestore.
///
/// Fields apart from [FirestoreModel.model] can be used
/// to attach Firestore-specific metadata to in-app models.
///
/// This example attaches the Firestore document ID to the represented model.
abstract class FirestoreModel<T extends BaseModel> {
  /// The id of the wrapped model in Firestore
  final String modelID;

  /// The in-app model
  final T model;

  FirestoreModel({
    required this.modelID,
    required this.model,
  });

  static FirestoreModel<T> from<T extends BaseModel>(
    String modelID,
    T model,
  ) {
    return _firestoreWrapperModelMap[T](modelID, model) as FirestoreModel<T>;
  }
}
