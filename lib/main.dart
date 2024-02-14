import 'package:challenger/screens/missions_screen.dart';
import 'package:challenger/screens/skill_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/profile_screen.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:challenger/components/app_bars.dart';

Future<void> main() async {
  // User obj = User(fullName: 'alireza', nickName: 'challenger');
  // obj.addExp(92);
  // print('--------------------');
  // print(obj.getUserLevel);
  // print(obj.getUserExp);
  // print(obj.getExpNeededToLevelUp);
  // print(obj.getExpPerc / 100);



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

