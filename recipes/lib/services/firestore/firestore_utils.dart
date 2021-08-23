import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipes/models/index.dart';

/// Static utility class to access Firestore collections of [FirestoreModel]s
class FirestoreUtils {
  static final _firestore = FirebaseFirestore.instance;

  /// [Map] to associate the [FirestoreModel] specializations with the
  /// names of their enclosing collection in Firestore
  static final Map<Type, String> _collectionPathMap = {
    FirestoreRecipe: 'recipes',
    FirestoreAuthor: 'recipes' // Authors are stored as sub-documents of recipes
  };

  /// [Map] serving as a cache to [FirestoreUtils.collection].
  static final Map<Type, CollectionReference> _collectionReferenceMap = {};

  /// Returns a [Stream] of a [List] holding [BaseModel] objects
  /// of type [M] where the documents belong to the currently logged in
  /// user's ID.
  static Stream<List<M>>
      modelStream<M extends BaseModel, F extends FirestoreModel>() {
    final firestoreModelStream = FirestoreUtils.firestoreModelStream<F>();
    return firestoreModelStream.map((firestoreModelList) =>
        (firestoreModelList as List<FirestoreModel<M>>)
            .map((firestoreModel) => firestoreModel.model)
            .toList());
  }

  /// Returns a [Stream] of a [List] holding [FirestoreModel] objects
  /// of type [T] where the documents belong to the currently logged in
  /// user's ID.
  static Stream<List<T>> firestoreModelStream<T extends FirestoreModel>() {
    final snapshotStream = collection<T>().snapshots();
    return snapshotStream.map<List<T>>((querySnapshot) => querySnapshot.docs
        .map<T>((queryDocSnapshot) => queryDocSnapshot.data())
        .toList());
  }

  /// Returns the converted [CollectionReference] wrapping [FirestoreModel]
  /// objects of type [T].
  static CollectionReference<T> collection<T extends FirestoreModel>() {
    final collectionPath = _collectionPathMap[T]!;
    if (!_collectionReferenceMap.containsKey(T)) {
      _collectionReferenceMap[T] = _convertedCollection<T>(collectionPath);
    }
    return _collectionReferenceMap[T] as CollectionReference<T>;
  }

  /// Returns a new [CollectionReference] with a converter for type [T]
  /// to the supplied [collectionPath].
  ///
  /// Calls ``Converters.mapConverter<T>()`` under the hood to access
  /// the [MapConverter] associated with the passed type [T].
  static CollectionReference<T> _convertedCollection<T extends FirestoreModel>(
      String collectionPath) {
    final converter = Converters.mapConverter<T>();
    return _firestore.collection(collectionPath).withConverter(
          fromFirestore: (snap, _) => converter.fromMap(snap.data()!),
          toFirestore: (model, _) => converter.toMap(model),
        );
  }
}
