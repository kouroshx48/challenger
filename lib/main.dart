import 'package:challenger/controllers/leveling.dart';
import 'package:challenger/controllers/mission.dart';
import 'package:challenger/controllers/skill.dart';
import 'package:challenger/controllers/topic.dart';
import 'package:challenger/controllers/user.dart';
import 'package:challenger/screens/missions_screen.dart';
import 'package:challenger/screens/skill_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'screens/profile_screen.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:challenger/components/app_bars.dart';

Future<void> main() async {

  await Hive.initFlutter();

  //register adapters
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(LevelingAdapter());
  Hive.registerAdapter(SkillAdapter());
  Hive.registerAdapter(TopicAdapter());
  Hive.registerAdapter(MissionAdapter());

  //open <users> box
  await Hive.openBox('users');

  var userBox = Hive.box('users');
  userBox.put('test@email.com', User(fullName: 'kourosh'));

  User user = userBox.get('test@email.com');
  user.addExpToUser(13);
  user.addNewSkill(Skill(name: 'test', skillType: 'Active'));
  print('level info ---------------------');
  print(user.getLevelObject.getLevel);
  print(user.getLevelObject.getExp);
  print(user.getLevelObject.getLevelUpExp);
  print('skill info ---------------------');
  print(user.getUserSkills[0].name);


  //to update every thing happened update the user
  //funcUpdate(User newUser){
  // Hive.put('email', newUser)
  // }


  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey[400],));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PageController(),
      theme: ThemeData(
        fontFamily: 'RobotoC',
        primaryColor: Colors.grey[400]
      ),
    );
  }
}

class PageController extends StatefulWidget {
  const PageController({super.key});

  @override
  State<PageController> createState() => _PageControllerState();
}

class _PageControllerState extends State<PageController> {
  @override
  Widget build(BuildContext context) {


    List<Widget> screens = const [
      SkillScreen(),
      Profile(),
      Challenges()
    ];
    Map<int,PreferredSizeWidget> appBars = {
      0:screenAppBar('Skills'),
      1: screenAppBar('Challenger Profile'),
      2: screenAppBar('Missions')
    };
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.grey[400],
      appBar: appBars[_selectedItemPosition],
      body: screens[_selectedItemPosition],
      bottomNavigationBar:snakeNavBar(),
    );
  }

  SnakeBarBehaviour behaviour = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.fromLTRB(70, 0, 70, 20);
  ShapeBorder shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeShape snakeShape = SnakeShape.circle;
  int _selectedItemPosition = 1;

  Widget snakeNavBar() {
    return SnakeNavigationBar.color(
      behaviour: behaviour,
      snakeShape: snakeShape,
      shape: shape,
      padding: padding,
      currentIndex: _selectedItemPosition,
      snakeViewColor: Colors.black87,
      backgroundColor: Colors.grey[500],
      selectedItemColor: Colors.grey[400],
      unselectedItemColor: Colors.grey[700],


      onTap: (index) =>
          setState(() {
            _selectedItemPosition = index;
          }),


      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.cabin)),
        BottomNavigationBarItem(icon: Icon(Icons.person)),
        BottomNavigationBarItem(icon: Icon(Icons.add)),
      ],
    );
  }
}

