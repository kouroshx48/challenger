import 'package:challenger/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:challenger/components/my_text_field.dart';

class DiaLogBox extends StatelessWidget {
  final nameController;
  final expController;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DiaLogBox({
    super.key,
    required this.nameController,
    required this.expController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[500],
      content: Container(
        padding: const EdgeInsets.all(8),
        height: 225,
        width: 350,
        child:  Column(
          children: [
             MyTextField(controller:nameController,hintText: 'Mission Name'),
            const SizedBox(height: 14,),
             MyTextField(controller:expController,hintText: 'Exp Amount (lower than 75)'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(buttonText: 'cancel', onPressed: onCancel),
                MyButton(buttonText: 'save', onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }

}
