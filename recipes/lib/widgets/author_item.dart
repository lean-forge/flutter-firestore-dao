import 'package:flutter/material.dart';
import 'package:recipes/models/index.dart';

class AuthorItem extends StatelessWidget {
  final Author author;

  AuthorItem(this.author);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(author.name, style: Theme.of(context).textTheme.headline5,),
              Icon(author.gender == Gender.Female ? Icons.female : Icons.male)
            ],
          ),
        ));
  }
}
