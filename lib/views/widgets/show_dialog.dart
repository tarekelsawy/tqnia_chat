import 'package:flutter/material.dart';

import '../../core/utils/styles.dart';
import 'text_widget.dart';

void showError(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: TextWidget(
                text: 'Something went wrong',
                style: Styles.textStyleSize18Weight700),
            content: SingleChildScrollView(
              child: SelectableText(message),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Ok',
                    style: Styles.textStyleSize20Weight500,
                  ))
            ],
          );
        });
  }