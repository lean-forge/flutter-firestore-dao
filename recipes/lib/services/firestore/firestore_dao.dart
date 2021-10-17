import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes/models/index.dart';
import 'package:recipes/services/firestore/firestore_author_dao.dart';
import 'package:recipes/services/firestore/firestore_recipe_dao.dart';
import 'package:recipes/services/firestore/firestore_user_preference_dao.dart';

/// Interface for model-specific Firestore interaction.
abstract class FirestoreDao<T extends BaseModel> {
  /// Public [FirebaseFirestore] instance to be accessed by the descendants
  /// of this class
  final firestore = FirebaseFirestore.instance;

  /// [Map] to associate child [Type]s of [BaseModel] with their corresponding
  /// [FirestoreDao] implementation constructors
  /// to be used in the [FirestoreDao.of] call.
  ///
  /// Returning new instances are necessary to prevent errors resulting from
  /// already consumed [Stream]s.
  static final Map<Type, dynamic> _firestoreDaoMap = {
    Author: () => FirestoreAuthorDao(),
    Recipe: () => FirestoreRecipeDao(),
    UserPreference: () => FirestoreUserPreferenceDao(),
  };

  /// Returns all the [BaseModel] instances read from Firestore
  /// as a [Stream] of a [List].
  ///
  /// Calling this method is ideal to use in a [StreamProvider]
  /// or in a [StreamBuilder].
  Stream<List<T>> modelStream();

  /// Persists the passed [model] to Firestore and returns its ID as a [String].
  void write(T model);

  /// Utility method to access thr concrete [FirestoreDao] instance
  /// associated with the [BaseModel] of type [T].
  ///
  /// The mapping between [T] and the [FirestoreDao] instance needs to be
  /// set in [FirestoreDao._firestoreDaoMap] to make this call work as expected.
  static FirestoreDao<T> of<T extends BaseModel>() {
    return _firestoreDaoMap[T]() as FirestoreDao<T>;
  }
}
