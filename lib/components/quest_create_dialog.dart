import 'package:challenger/components/my_button.dart';
import 'package:challenger/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuestDialog extends StatefulWidget {
   const QuestDialog(
      {super.key,
      required this.questNameController,
      required this.expAmountController,
      required this.onSave,
      required this.onCancel,
      required this.selectedDate,
      required this.onDatePicker
      });

  final TextEditingController questNameController;
  final TextEditingController expAmountController;
  final DateTime selectedDate;
  final VoidCallback onDatePicker;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  static bool checkBoxValue = false;

  @override
  State<QuestDialog> createState() => _QuestDialogState();
}

class _QuestDialogState extends State<QuestDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.grey.shade400,
        title: Center(
            child: Text(
          "New Quest",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey.shade700),
        )),
        content: SizedBox(
          height: 410,
          width: 300,
          child: Column(
            children: [
              MyTextField(
                  hintText: 'Quest Name',
                  controller: widget.questNameController),
              const SizedBox(
                height: 12,
              ),
              MyTextField(
                  hintText: 'Exp Amount',
                  controller: widget.expAmountController),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () => widget.onDatePicker(),
                child: MyTextField(
                  hintText: 'select date',
                  controller: TextEditingController(),
                  isActive: false,
                  suffixWidget: const Icon(Icons.access_time_outlined),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'daily repeat?',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Checkbox(
                    value: QuestDialog.checkBoxValue,
                    onChanged: (value) => setState(() {
                      QuestDialog.checkBoxValue = value!;
                    }),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(buttonText: 'Save', onPressed: widget.onSave),
                  MyButton(buttonText: 'Cancel', onPressed: widget.onCancel),
                ],
              )
            ],
          ),
        ));
  }
}
