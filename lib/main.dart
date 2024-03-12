import 'package:challenger/data/user_data_base.dart';
import 'package:challenger/screens/auth_screen.dart';
import 'package:challenger/screens/missions_screen.dart';
import 'package:challenger/screens/quests_screen.dart';
import 'package:challenger/screens/skill_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/profile_screen.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:challenger/components/app_bars.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //open isar instance
  await ChallengerDB.initialize();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey[400],
  ));

  runApp(ChangeNotifierProvider(
    create: (context) => ChallengerDB(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
      theme: ThemeData(fontFamily: 'RobotoC', primaryColor: Colors.grey[400]),
    );
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _PageControllerState();
}

class _PageControllerState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [QuestsScreen(),SkillScreen(), Profile(), Challenges()];
    Map<int, PreferredSizeWidget> appBars = {
      0: screenAppBar('Daily Quests'),
      1: screenAppBar('Skills'),
      2: screenAppBar('Challenger Profile'),
      3: screenAppBar('Missions')
    };
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.grey[400],
      appBar: appBars[_selectedItemPosition],
      body: screens[_selectedItemPosition],
      bottomNavigationBar: snakeNavBar(),
    );
  }

  SnakeBarBehaviour behaviour = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.fromLTRB(70, 0, 70, 20);
  ShapeBorder shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeShape snakeShape = SnakeShape.circle;
  int _selectedItemPosition = 2;

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
      onTap: (index) => setState(() {
        _selectedItemPosition = index;
      }),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit_sharp)),
        BottomNavigationBarItem(icon: Icon(Icons.cabin)),
        BottomNavigationBarItem(icon: Icon(Icons.person)),
        BottomNavigationBarItem(icon: Icon(Icons.add)),
      ],
    );
  }
}
