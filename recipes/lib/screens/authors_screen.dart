import 'package:flutter/material.dart';
import 'package:recipes/models/index.dart';
import 'package:recipes/services/index.dart';
import 'package:recipes/widgets/author_item.dart';

class AuthorsScreen extends StatelessWidget {
  static final String routeName = 'authors';

  Widget _buildAuthorList() {
    return StreamBuilder(
      stream: FirestoreDao.of<Author>().modelStream(),
      builder: (ctx, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text('Error'),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final authors = (snapshot.data as List<Author>).toSet().toList();
        return ListView.builder(
          itemBuilder: (ctx, idx) => AuthorItem(authors[idx]),
          itemCount: authors.length,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Authors'),
      ),
      body: _buildAuthorList(),
    );
  }
}
