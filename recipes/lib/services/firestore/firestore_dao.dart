import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes/models/index.dart';
import 'package:recipes/services/firestore/firestore_author_dao.dart';
import 'package:recipes/services/firestore/firestore_recipe_dao.dart';

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
  };

  /// Returns an [BaseModel] instance based on the provided [path]
  /// or ``null`` if no record can be found in Firestore with such a [path].
  Future<T?> getByPath(String path);

  /// Returns all the [BaseModel] instances read from Firestore
  /// as a [Stream] of a [List].
  ///
  /// Calling this method is ideal to use in a [StreamProvider]
  /// or in a [StreamBuilder].
  Stream<List<T>> modelStream();

  /// Persists the passed [model] to Firestore.
  ///
  /// The method uses [auxMap] as a helper object to pass additional arguments
  /// to writes, such as the document path in Firestore or the [WriteBatch]
  /// object to be used.
  Future<void> write(T model, {Map<String, Object>? auxMap});

  /// Utility method to access thr concrete [FirestoreDao] instance
  /// associated with the [BaseModel] of type [T].
  ///
  /// The mapping between [T] and the [FirestoreDao] instance needs to be
  /// set in [FirestoreDao._firestoreDaoMap] to make this call work as expected.
  static FirestoreDao<T> of<T extends BaseModel>() {
    return _firestoreDaoMap[T]() as FirestoreDao<T>;
  }
}