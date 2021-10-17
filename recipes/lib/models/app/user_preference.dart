import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recipes/models/index.dart';

class UserPreferenceMapConverter implements MapConverter<UserPreference> {
  const UserPreferenceMapConverter();

  @override
  UserPreference fromMap(Map<String, Object?> json) {
    return UserPreference(
      appPrimaryColor: Color(json['appPrimaryColor'] as int),
      dateModified: dateFormat.parse(json['dateModified'] as String),
    );
  }

  @override
  Map<String, Object?> toMap(UserPreference model) {
    return {
      'appPrimaryColor': model.appPrimaryColor.value,
      'dateModified': dateFormat.format(model.dateModified),
    };
  }
}

final dateFormat = DateFormat('yyyy.MM.dd-HH:mm:ss');

class UserPreference extends BaseModel {
  final Color appPrimaryColor;
  final DateTime dateModified;

  UserPreference({
    required this.appPrimaryColor,
    required this.dateModified,
  });

  @override
  String toString() {
    return 'UserPreference{'
        'appPrimaryColor: $appPrimaryColor, '
        'dateModified: $dateModified}';
  }
}
