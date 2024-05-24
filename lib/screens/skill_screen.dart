import 'dart:async';

import 'package:challenger/components/clippers.dart';
import 'package:challenger/components/skill_tile.dart';
import 'package:challenger/data/user_data_base.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../components/skill_create_dialog.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  double percentage = .2;

  Timer? skillTimer;

  //check if a new skill is created or not
  //TODO shall be saved in Isar in timer part
  bool? isSkillCreated;

  Duration? _onFormat;
  double? _percent;

  //load data from isar
  void _loadData() async {
    context.read<ChallengerDB>().readData();
    final settings = context.read<ChallengerDB>().currentUser!.userSettings;
    isSkillCreated = settings.skillISCreated;
    _onFormat = Duration(seconds: settings.skillCreationCoolDown);
    _percent = 0;
    loadTimer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    skillTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengerDB>(
        builder: (context, value, child) => Stack(
              children: [
                ListView.builder(
                    padding: const EdgeInsets.only(top: 175),
                    itemCount: value.skills!.length,
                    itemBuilder: (context, index) {
                      return SkillTile(
                        skillIndex: index,
                      );
                    }),
                ClipPath(
                  clipper: SkillClipper(),
                  child: Container(
                    height: 232,
                    color: Colors.grey[500],
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 72.0),
                      child: Center(
                        child: CircularPercentIndicator(
                          radius: 80,
                          lineWidth: 15,
                          percent: _percent!,
                          animation: true,
                          animationDuration: 1500,
                          backgroundColor: Colors.black12,
                          progressColor: percentage < .5
                              ? Colors.red.shade400
                              : (percentage < .75
                                  ? Colors.orange.shade400
                                  : Colors.green.shade400),
                          curve: Curves.linearToEaseOut,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: value.currentUser!.userSettings.skillISCreated
                              ? onSkillWaitTimeWidget()
                              : addSkillWidget(),
                          animateFromLastPercent: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }

  Widget addSkillWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) =>
                        SkillCreationBox(startTimer: startSkillTimer));
              },
              child: const Icon(
                Icons.add,
                size: 40,
              )),
          const Text(
            'Add New Skill',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget onSkillWaitTimeWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Time To New Skill', style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.bold),),
        Text(
          formatDuration(_onFormat!),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }

  void startSkillTimer() {
    final settings = context.read<ChallengerDB>().currentUser!.userSettings;
    final now = DateTime.now();
    settings.skillCreatedTime = now;
    settings.skillISCreated = true;
    context.read<ChallengerDB>().updateDate();
    loadTimer();
  }

  void loadTimer() {
    final settings = context.read<ChallengerDB>().currentUser!.userSettings;
    if (settings.skillISCreated) {
      DateTime? timeSkillCreated = settings.skillCreatedTime;
      skillTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final settings = context.read<ChallengerDB>().currentUser!.userSettings;
        //time that is now after every second
        var newTime = DateTime.now();
        var diff = newTime.difference(timeSkillCreated!);
        setState(() {
          _onFormat = Duration(
              seconds: (settings.skillCreationCoolDown - diff.inSeconds));
          _percent = diff.inSeconds / settings.skillCreationCoolDown;
        });
        if (diff.inSeconds >= settings.skillCreationCoolDown) {
          settings.resetSkillTimerToZero();
          context.read<ChallengerDB>().updateDate();
          timer.cancel();
          setState(() {
            _percent = 0;
          });
        }
      });
    }
  }

  String formatDuration(Duration duration) {
    int days = duration.inDays;
    int hours = duration.inHours.remainder(24);
    int minutes = duration.inMinutes % 60;
    int seconds = duration.inSeconds % 60;

    String daysInStr = days >= 10 ? '$days' : '0$days';
    String hoursInStr = hours >= 10 ? '$hours' : '0$hours';
    String minutesInStr = minutes >= 10 ? '$minutes' : '0$minutes';
    String secondsInStr = seconds >= 10 ? '$seconds' : '0$seconds';

    return '$daysInStr:$hoursInStr:$minutesInStr:$secondsInStr';
  }
}
