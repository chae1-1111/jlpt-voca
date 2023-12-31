import 'package:flutter/material.dart';
import 'package:voca/screens/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JLPT 단어장",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: Colors.yellow[100],
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 100,
            fontFamily: "NotoSansJP",
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: TextStyle(
            fontSize: 35,
            fontFamily: "NotoSansJP",
            color: Colors.black,
          ),
          labelMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            fontFamily: "NotoSansJP",
          ),
          labelSmall: TextStyle(
            fontSize: 13,
            fontFamily: "NotoSansJP",
          ),
        ),
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const MainScreen(),
    );
  }
}
