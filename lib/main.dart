import 'package:flutter/material.dart';

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
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "JLPT 단어장",
          ),
        ),
        body: Container(),
      ),
    );
  }
}
