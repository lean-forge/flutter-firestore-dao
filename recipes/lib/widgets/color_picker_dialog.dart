import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:recipes/models/index.dart';
import 'package:recipes/services/firestore/firestore_dao.dart';

class ColorPickerDialog extends StatelessWidget {
  const ColorPickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pick a color, any color! 🎨'),
      content: SingleChildScrollView(
        child: MaterialPicker(
          pickerColor: Theme.of(context).primaryColor,
          onColorChanged: _onColorChanged,
        ),
      ),
    );
  }

  void _onColorChanged(Color newColor) {
    final newPreference = UserPreference(
      appPrimaryColor: newColor,
      dateModified: DateTime.now(),
    );
    FirestoreDao.of<UserPreference>().write(newPreference);
  }
}
