import 'package:challenger/components/my_button.dart';
import 'package:challenger/components/my_drop_down.dart';
import 'package:challenger/controllers/skill.dart';
import 'package:challenger/data/user_data_base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_text_field.dart';

class SkillCreationBox extends StatefulWidget {
  const SkillCreationBox({super.key, required this.startTimer});
  final VoidCallback startTimer;

  @override
  State<SkillCreationBox> createState() => _SkillCreationBoxState();
}

class _SkillCreationBoxState extends State<SkillCreationBox> {
  final _skillNameController = TextEditingController();

  final _skillTypes = ['Active', 'Passive'];
  late String _skillType = _skillTypes.first;
   // final _skillDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengerDB>(
      builder: (BuildContext context, value, Widget? child) => AlertDialog(
        content: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          width: 300,
          height: 350,
          child: Column(
            children: [
              MyTextField(
                hintText: 'Skill Name',
                controller: _skillNameController,
              ),
              const SizedBox(
                height: 15,
              ),
              MyDropDown(dropDownItems: _skillTypes, onValueChange: _skillTypeDropdownChange),
              const SizedBox(
                height: 15,
              ),
              // MyTextField(
              //     hintText: 'Skill Description',
              //     controller: _skillDescriptionController),
              const Spacer(),
              Row(
                children: [
                  MyButton(buttonText: 'Save', onPressed: saveSkill),
                  const Spacer(),
                  MyButton(
                      buttonText: 'Cancel',
                      onPressed: () => Navigator.pop(context))
                ],
              )
            ],
          ),
        ),
        backgroundColor: Colors.grey[400],
        title: Center(
            child: Text(
          'Create New Skill',
          style:
              TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
  void _skillTypeDropdownChange(value) {
    _skillType = value;
  }
  void saveSkill() {
    if (_skillNameController.text.isNotEmpty) {
      List? skills = context.read<ChallengerDB>().skills;
      skills!.add(Skill(
          name: _skillNameController.text,
          skillType: _skillType));
      context.read<ChallengerDB>().updateDate();
      _skillNameController.clear();
      widget.startTimer();
      Navigator.pop(context);
    } else {
      _skillNameController.clear();
    }
  }
}
