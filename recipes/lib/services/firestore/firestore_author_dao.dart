import 'package:recipes/models/index.dart';
import 'package:recipes/services/index.dart';

class FirestoreAuthorDao extends FirestoreDao<Author> {
  @override
  Stream<List<Author>> modelStream() {
    return FirestoreUtils.modelStream<Author, FirestoreAuthor>();
  }
}
