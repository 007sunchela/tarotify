import 'package:flutter/material.dart';

void showErrorPdf(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.error, color: colorScheme.onPrimary),
            SizedBox(width: 10),
            Text('Ошибка PDF!', style: TextStyle(color: colorScheme.onPrimary)),
          ],
        ),
        content: Text(
          'Не удалось сохранить отчет!',
          style: TextStyle(fontSize: 16, color: colorScheme.onPrimary),
        ),
        backgroundColor: colorScheme.surface,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Закрыть',
              style: TextStyle(color: colorScheme.onPrimary),
            ),
          ),
        ],
      );
    },
  );
}
