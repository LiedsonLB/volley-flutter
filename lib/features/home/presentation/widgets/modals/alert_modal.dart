import 'package:flutter/material.dart';

class AlertModal extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;

  const AlertModal({super.key, required this.title, required this.content, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(content),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(buttonText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
