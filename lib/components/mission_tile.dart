import 'package:flutter/material.dart';
import 'package:challenger/controllers/mission.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MissionTile extends StatelessWidget {
  final Mission mission;
  final Function(BuildContext) deleteFunction;
  final Function(BuildContext) completeFunction;

  // final VoidCallback onPressed;

  const MissionTile(
      {super.key,
      required this.mission,
      required this.deleteFunction,
      required this.completeFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              foregroundColor: Colors.white,
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            SlidableAction(
              foregroundColor: Colors.white,
              onPressed: completeFunction,
              icon: Icons.check,
              backgroundColor: Colors.green.shade300,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: 350,
          height: 85,
          child: Row(
            children: [
              Text(
                mission.name,
                style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                width: 35,
              ),
              Text(
                "Exp Amount : ${mission.expAmount}",
                style: const TextStyle(
                    color: Colors.white38,
                    fontStyle: FontStyle.italic,
                    fontSize: 14),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white54,
                size: 18,
                weight: 700,
              ),
              const Text(
                'Swip',
                style: TextStyle(
                    color: Colors.white54, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
