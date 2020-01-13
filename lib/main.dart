import 'package:flutter/material.dart';
import 'package:quiz/pages/authentication/login_page.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new LoginPage(),
    );
  }
}
