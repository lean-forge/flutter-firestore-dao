import 'package:recipes/models/index.dart';
import 'package:recipes/services/index.dart';

class FirestoreAuthorDao extends FirestoreDao<Author> {
  @override
  Future<Author?> getByPath(String path) {
    return FirestoreUtils.modelFuture<Author, FirestoreAuthor>(path);
  }

  @override
  Stream<List<Author>> modelStream() {
    return FirestoreUtils.modelStream<Author, FirestoreAuthor>();
  }

  @override
  Future<void> write(Author model, {Map<String, Object>? auxMap}) {
    // No writes are performed in this application
    throw UnimplementedError();
  }

}