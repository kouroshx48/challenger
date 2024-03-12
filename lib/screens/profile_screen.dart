import 'package:challenger/controllers/user.dart';
import 'package:challenger/data/user_data_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:challenger/components/profile_card.dart';
import 'package:challenger/components/clippers.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color backGroundColor = Colors.white10;
  Color appBarColor = Colors.black26;
  Color textsColor = const Color(0xff54494b);
  Challenger test = Challenger(fullName: 'gg test bemola');


  void _loadData() {
    context.read<ChallengerDB>().readData();
  }

  @override
  void initState() {
    super.initState();
    //load the data for the first time
    _loadData();
  }

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // print('here');
    // _loadTheData();
    // print(db.currentUser.fullName);
    // print(db.currentUser.userLeveling.level);
    // print(db.currentUser.userLeveling.exp);
    // print(db.currentUser.userLeveling.levelUpExp);
    return Consumer<ChallengerDB>(
      builder: (context, value, child)=>SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                    clipper: ProfileClipper(),
                    child: Container(
                      color: Colors.grey[500],
                      height: 300,
                    )),
                 Padding(
                  padding:  const EdgeInsets.all(21),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const SizedBox(
                        height: 18,
                      ),
                      ProfileCard(challenger: value.currentUser ?? test,),
                    ],
                  ),
                ),
              ],
            ),
            const Center(
              child: Text('you are logged in'),
            ),
            Column(
              children: [
                Center(
                  child: MaterialButton(
                    onPressed: () => signUserOut(),
                    child: const Text('signOut'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
