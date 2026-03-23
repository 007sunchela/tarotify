import 'package:flutter/material.dart';

void showInfo(BuildContext context, String name) {
  final colorScheme = Theme.of(context).colorScheme;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: colorScheme.onPrimary),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(color: colorScheme.onPrimary),
            ),
          ],
        ),
        content: Text(
          'Вы вытянули карту: $name! Перейдите на вкладку "Закрытые карты", чтобы узнать подробную информацию!',
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
