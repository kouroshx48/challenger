import 'package:isar/isar.dart';

part 'daily_quest.g.dart';

@embedded
class DailyQuest {
  final String? name;
  final int? expAmount;
  int streak = 0;
  bool repeat = false;
  DateTime? timeToBeDone;
  List<DateTime> completedDates = [];
  List<DateTime> canceledDates = [];

  DailyQuest({
    this.name,
    this.expAmount,
  });
}