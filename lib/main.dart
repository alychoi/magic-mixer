import 'package:flutter/material.dart';
import 'package:my_app/pages/magic_mixer.dart';
import 'package:my_app/pages/message.dart';
import 'package:my_app/pages/profile.dart';
import 'package:my_app/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:my_app/pages/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int pageIndex = 0;

  final pages = [
    const SignIn(),
    const MagicMixer(),
    const ProfilePage(),
  ];

  void _handleIndexChanged(int newIndex) {
    setState(() {
      pageIndex = newIndex;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic Mixer',
      theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(244, 250, 156, 1),
        body: pages[pageIndex],
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(
            margin: EdgeInsets.only(left: 10, right: 10),
            dotIndicatorColor: Color(0xfffcffd8),
            currentIndex: pageIndex,
            unselectedItemColor: Colors.black,
            backgroundColor: Color(0xfffcffd8),
            onTap: _handleIndexChanged,
            enablePaddingAnimation: false,
            items: [
              DotNavigationBarItem(
                icon: Icon(Icons.favorite),
                selectedColor: Color(0xffba53de),
              ),
              DotNavigationBarItem(
                icon: Icon(Icons.search),
                selectedColor: Color(0xffba53de),
              ),
              DotNavigationBarItem(
                icon: Icon(Icons.person),
                selectedColor: Color(0xffba53de),
              )
            ]
          )
        )
      ),
    );
  }
}