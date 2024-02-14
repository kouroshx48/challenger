import 'package:flutter/material.dart';
import 'package:challenger/components/profile_card.dart';
import 'package:challenger/components/clippers.dart';

import 'package:challenger/controllers/user.dart';
import 'package:hive_flutter/adapters.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color backGroundColor = Colors.white10;
  Color appBarColor = Colors.black26;
  Color textsColor = const Color(0xff54494b);
  User test = testUser;
  
  @override
  Widget build(BuildContext context) {

    // print('here');
    return Stack(
      children: [
        ClipPath(
            clipper: ProfileClipper(),
            child: Container(
              color: Colors.grey[500],
              height: 300,
            )),
        Padding(
          padding: const EdgeInsets.all(21),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 18,
              ),
              ProfileCard(
                  challenger: test,)
            ],
          ),
        ),
      ],
    );
  }
}
