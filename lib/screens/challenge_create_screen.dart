import 'package:challenger/components/my_button.dart';
import 'package:challenger/components/my_drop_down.dart';
import 'package:challenger/components/my_text_field.dart';
import 'package:challenger/controllers/daily_quest.dart';
import 'package:challenger/data/user_data_base.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChallengeCreatorScreen extends StatefulWidget {
  const ChallengeCreatorScreen({super.key, required this.pageChanger});

  final VoidCallback pageChanger;

  @override
  State<ChallengeCreatorScreen> createState() => _ChallengeCreatorScreenState();
}

class _ChallengeCreatorScreenState extends State<ChallengeCreatorScreen> {
  final _challengeName = TextEditingController();
  final _count = TextEditingController();
  final _goal = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final List<String> _typesList = ['daily', 'weekly', 'monthly'];
  late String _typeValue = _typesList.first;
  final List<String> _challengeTypeList = const ["Reaching", "Repeating"];
  late String _challengeType = _challengeTypeList.first;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengerDB>(
      builder: (context, ChallengerDB value, child) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextField(
                hintText: 'Challenge name',
                controller: _challengeName,
              ),
              const SizedBox(
                height: 12,
              ),
              MyTextField(hintText: 'Challenge goal', controller: _goal),
              const SizedBox(
                height: 12,
              ),
              MyDropDown(
                  dropDownItems: _challengeTypeList,
                  onValueChange: _challengeTypeDropdownChange),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                  onTap: () {
                    _showDatePicker(context);
                  },
                  child: MyTextField(
                    hintText:
                        "start date : ${DateFormat('yyyy-MM-dd').format(_selectedDate)}",
                    controller: TextEditingController(),
                    isActive: false,
                    suffixWidget: const Icon(Icons.date_range),
                  )),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 1 / 2 - 50,
                      child: MyDropDown(
                        dropDownItems: _typesList,
                        onValueChange: _typeDropdownChange,
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: MyTextField(hintText: 'count', controller: _count))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      buttonText: 'save',
                      onPressed: () {
                        _onChallengeSave();
                      }),
                  MyButton(
                      buttonText: 'back',
                      onPressed: () => widget.pageChanger()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2020),
        lastDate: DateTime(2200),
        initialDate: _selectedDate);
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _typeDropdownChange(value) {
    _typeValue = value;
  }

  void _challengeTypeDropdownChange(value) {
    _challengeType = value;
  }

  void _onChallengeSave() {
    if (_challengeName.text.isNotEmpty ||
        _count.text.isNotEmpty ||
        _goal.text.isNotEmpty) {
      var challenge =
          context.read<ChallengerDB>().currentUser?.currentChallenge;
      print(_typeValue);
      challenge?.name = _challengeName.text;
      challenge?.goal = int.parse(_goal.text);
      challenge?.startDate = _selectedDate;
      switch (_typeValue) {
        case 'daily':
          challenge?.days = int.parse(_count.text);
          break;
        case 'weekly':
          challenge?.days = int.parse(_count.text) * 7;
          break;
        case 'monthly':
          challenge?.days = int.parse(_count.text) * 30;
          break;
      }
      if (_challengeType == "Reaching") {
        for (int i = 1; i <= challenge!.days!; i++) {
          int goalPerDay = ((challenge.goal! / challenge.days!) * i).floor();
          DailyQuest step =
              DailyQuest(name: "Today's goal : $goalPerDay", expAmount: 10);
          step.timeToBeDone = DateUtils.addDaysToDate(_selectedDate, i - 1);
          //add step to list
          context.read<ChallengerDB>().challengeSteps?.add(step);
        }
      }
      //todo repeating steps
      else if (_challengeType == "Repeating") {
        int goalPerDay = challenge!.goal!;
        for (int i = 1; i <= challenge.days!; i++) {
          DailyQuest step =
              DailyQuest(name: "Today's goal : $goalPerDay", expAmount: 10);
          step.timeToBeDone = DateUtils.addDaysToDate(_selectedDate, i - 1);
          context.read<ChallengerDB>().challengeSteps?.add(step);
        }
        context.read<ChallengerDB>().updateDate();
      }

      context.read<ChallengerDB>().updateDate();
      _challengeName.clear();
      _goal.clear();
      _count.clear();
      widget.pageChanger();
    }
  }
}
