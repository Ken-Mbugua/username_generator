import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme:ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter I guess'),
        ),
        body: Center(
          child: RandomUsername(),
        ),
      ),
    );
  }
}

class RandomUsernameState extends State<RandomUsername> {
  @override
  Widget build(BuildContext context) {
    final usernamePair = WordPair.random();
    return Text(usernamePair.asPascalCase);
  }
}

class RandomUsername extends StatefulWidget {
  @override
  RandomUsernameState createState() => new RandomUsernameState();
}