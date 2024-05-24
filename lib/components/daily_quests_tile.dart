import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../controllers/daily_quest.dart';

class QuestTile extends StatelessWidget {
  final DailyQuest dailyQuest;

  const QuestTile(
      {super.key,
      required this.dailyQuest,
      this.isCompleted = false,
      this.isCanceled = false,
      required this.onComplete,
      required this.onCancel,
      required this.onDelete});

  final bool isCompleted;
  final bool isCanceled;
  final VoidCallback onComplete;
  final VoidCallback onCancel;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
      child: Slidable(
        endActionPane: !(isCompleted || isCanceled)
            ? ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    foregroundColor: Colors.white,
                    onPressed: (context) {
                      onCancel();
                    },
                    icon: CupertinoIcons.clear_thick,
                    backgroundColor: Colors.yellow.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SlidableAction(
                    foregroundColor: Colors.white,
                    onPressed: (context) {
                      onComplete();
                    },
                    icon: Icons.check,
                    backgroundColor: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(10),
                  )
                ],
              )
            : null,
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            foregroundColor: Colors.white,
            onPressed: (context) {
              onDelete();
            },
            icon: CupertinoIcons.delete,
            backgroundColor: Colors.grey.shade600,
            borderRadius: BorderRadius.circular(10),
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.only(left: 12, top: 8, bottom: 12),
          height: 85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[800]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dailyQuest.name!,
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'Exp Amount : ${dailyQuest.expAmount}',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic,
                          fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Streak : ', //add streak here
                      style: TextStyle(
                          color: Colors.red.shade300,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      dailyQuest.streak.toString(),
                      style: TextStyle(
                          color: Colors.yellow.shade600,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    isCompleted
                        ? Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 18),
                                  child: Icon(
                                    Icons.check_sharp,
                                    size: 32,
                                    color: Colors.green[400],
                                  ))
                            ],
                          )
                        : (isCanceled)
                            ? Column(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(left: 18),
                                      child: Icon(
                                        CupertinoIcons.clear,
                                        size: 32,
                                        color: Colors.red[400],
                                      ))
                                ],
                              )
                            : Container(
                                padding: const EdgeInsets.only(right: 15),
                              )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
