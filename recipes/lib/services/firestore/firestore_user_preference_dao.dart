import 'package:recipes/models/index.dart';
import 'package:recipes/services/firestore/index.dart';

class FirestoreUserPreferenceDao extends FirestoreDao<UserPreference> {
  @override
  Stream<List<UserPreference>> modelStream() {
    return FirestoreUtils.modelStream<UserPreference,
        FirestoreUserPreference>();
  }

  @override
  void write(UserPreference model) {
    final collection = FirestoreUtils.collection<FirestoreUserPreference>();
    final ref = collection.doc();
    // Create a new ref and a FirestoreModel by attaching the docRef to it
    final modelID = ref.id;
    final firestoreModel = FirestoreModel.from<UserPreference>(modelID, model)
        as FirestoreUserPreference;
    // Execute the write operation
    final writeBatch = firestore.batch();
    writeBatch.set(ref, firestoreModel);
    writeBatch.commit();
  }
}
