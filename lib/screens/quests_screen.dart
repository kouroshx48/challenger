import 'package:challenger/components/clippers.dart';
import 'package:challenger/components/quest_create_dialog.dart';
import 'package:challenger/controllers/daily_quest.dart';
import 'package:challenger/data/user_data_base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../components/daily_quests_tile.dart';

class QuestsScreen extends StatefulWidget {
  const QuestsScreen({super.key});

  @override
  State<QuestsScreen> createState() => _QuestsScreenState();
}

class _QuestsScreenState extends State<QuestsScreen> {
  DateTime startDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  DateTime _focused = DateTime.now();
  DateTime _pickedTime = DateTime.now();

  void _loadData() {
    context.read<ChallengerDB>().readData();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  final TextEditingController _questName = TextEditingController();
  final TextEditingController _expAmountName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengerDB>(
        builder: (context, ChallengerDB value, child) => Stack(
              children: [
                ListView.builder(
                    padding: const EdgeInsets.only(top: 200),
                    itemCount: _getEventsForDay(_selectedDate).length,
                    itemBuilder: (context, index) => InkWell(
                          onDoubleTap: () => removeQuest(
                              _getEventsForDay(_selectedDate)[index]),
                          child: QuestTile(
                            dailyQuest: _getEventsForDay(_selectedDate)[index],
                            isCompleted: _isCompleted(
                                _getEventsForDay(_selectedDate)[index]),
                            isCanceled: _isCanceled(
                                _getEventsForDay(_selectedDate)[index]),
                            onComplete: () {
                              _onComplete(
                                  _getEventsForDay(_selectedDate)[index]);
                            },
                            onCancel: (){
                              _onCancel(
                                  _getEventsForDay(_selectedDate)[index]);
                            },
                          ),
                        )),
                Column(
                  children: [
                    Container(color: Colors.grey, child: calenderPicker()),
                    ClipPath(
                      clipper: QuestClipper(),
                      child: Container(
                        height: 90,
                        color: Colors.grey.shade500,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: InkWell(
                                onTap: () => createQuestBox(),
                                child: const Icon(
                                  Icons.add,
                                  size: 32,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }

  void createQuestBox() {
    showDialog(
        context: context,
        builder: (context) => QuestDialog(
              questNameController: _questName,
              expAmountController: _expAmountName,
              selectedDate: _pickedTime,
              onDatePicker: () => _showDatePicker(context),
              onSave: () => onQuestSave(),
              onCancel: () {
                Navigator.pop(context);
                _questName.clear();
                _expAmountName.clear();
              },
            ));
  }

  void onQuestSave() {
    var quests = context.read<ChallengerDB>().quests;
    quests?.add(DailyQuest(
      name: _questName.text,
      expAmount: int.parse(_expAmountName.text),
    )
      ..repeat = QuestDialog.checkBoxValue
      ..timeToBeDone = _pickedTime);
    context.read<ChallengerDB>().updateDate();
    _questName.clear();
    _expAmountName.clear();
    QuestDialog.checkBoxValue = false;
    _pickedTime = DateTime.now();
    Navigator.pop(context);
  }

  Widget calenderPicker() {
    return TableCalendar(
      focusedDay: _focused,
      firstDay: DateTime(2020),
      lastDay: DateTime(2200),
      headerVisible: true,
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: false,
          titleTextStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 18,
              fontWeight: FontWeight.bold),
          headerPadding: const EdgeInsets.only(left: 16, bottom: 12),
          leftChevronVisible: false,
          rightChevronVisible: false),
      calendarStyle: CalendarStyle(
          defaultDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          weekendDecoration: const BoxDecoration(shape: BoxShape.rectangle),
          defaultTextStyle: const TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
          weekendTextStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.bold),
          isTodayHighlighted: true,
          todayDecoration: BoxDecoration(
            color: Colors.grey[700],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
          ),
          todayTextStyle: TextStyle(
              color: Colors.grey[200],
              fontSize: 18,
              fontWeight: FontWeight.bold)),
      daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black54),
          weekendStyle:
              TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
      calendarFormat: CalendarFormat.week,
      currentDay: _selectedDate,
      onDaySelected: (selected, focused) {
        setState(() {
          _selectedDate = selected;
        });
      },
      onPageChanged: (focus) {
        _focused = focus;
      },
      eventLoader: (day) {
        return _getEventsForDay(day);
      },
    );
  }

  List _getEventsForDay(DateTime day) {
    final quests = context.read<ChallengerDB>().quests;
    List eventsOfDay = [];
    for (DailyQuest quest in quests!) {
      if (quest.timeToBeDone != null || quest.repeat) {
        if (DateUtils.isSameDay(quest.timeToBeDone, day) || quest.repeat) {
          if (quest.repeat) {
            if (DateUtils.isSameDay(quest.timeToBeDone, day) ||
                day.isAfter(quest.timeToBeDone!)) {
              eventsOfDay.add(quest);
            }
          } else {
            eventsOfDay.add(quest);
          }
        }
      }
    }
    return eventsOfDay;
  }

  void removeQuest(DailyQuest object) {
    var quests = context.read<ChallengerDB>().quests;
    quests!.remove(object);
    context.read<ChallengerDB>().updateDate();
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2020),
        lastDate: DateTime(2200),
        initialDate: _selectedDate);
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _pickedTime = picked;
      });
    }
  }

  bool _isCompleted(DailyQuest object) {
    for(DateTime day in object.completedDates){
      if(DateUtils.isSameDay(day, _selectedDate)){
        return true;
      }
    }
    return false;
  }

  bool _isCanceled(DailyQuest object){
    for(DateTime day in object.canceledDates){
      if(DateUtils.isSameDay(day, _selectedDate)){
        return true;
      }
    }
    return false;
  }

  void _onComplete(DailyQuest object) {
    var quests = context.read<ChallengerDB>().quests;
    int? index = quests?.indexOf(object);
    // print(index);
    // print(_selectedDate);
    quests![index!].completedDates.add(DateUtils.addDaysToDate(_selectedDate, 0));
    final user = context.read<ChallengerDB>().currentUser;
    user?.addExpToUser(object.expAmount! + object.streak);
    object.streak += 1;
    context.read<ChallengerDB>().updateDate();
  }
  void _onCancel(DailyQuest object){
    var quests = context.read<ChallengerDB>().quests;
    int? index = quests?.indexOf(object);
    quests![index!].streak = 0;
    quests[index].canceledDates.add(DateUtils.addDaysToDate(_selectedDate, 0));
    context.read<ChallengerDB>().updateDate();
  }
}
