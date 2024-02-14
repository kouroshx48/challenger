import 'package:challenger/controllers/user.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileCard extends StatelessWidget {
  final User challenger;

  const ProfileCard({super.key, required this.challenger});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [profileInfo()]);
  }

  Widget profileInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularPercentIndicator(
              radius: 60,
              lineWidth: 12.5,
              animation: true,
              animationDuration: 1000,
              animateFromLastPercent: true,
              percent: challenger.getExpPerc / 100,
              center: Text(
                'lvl ${challenger.getUserLevel}',
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black12,
              progressColor: Colors.black54,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            const SizedBox(
              width: 32,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenger.getFullName,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 27,
                ),
                SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Exp: ${challenger.getUserExp}',
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '/ ExpNeeded: ${challenger.getExpNeededToLevelUp}',
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
