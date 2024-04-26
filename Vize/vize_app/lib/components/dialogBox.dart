import 'package:flutter/material.dart';
import 'package:vizeapp/components/buttons.dart';
import '../core/localization.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:
                    AppLocalizations.of(context).getTranslate("add_new_task"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: AppLocalizations.of(context).getTranslate("save"),
                  onPressed: onSave,
                ),
                const SizedBox(width: 10),
                MyButton(
                  text: AppLocalizations.of(context).getTranslate("cancel"),
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
