import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
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
    final _suggestions = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 18.0, fontFamily: "arial");

    Widget buildSuggestions() {
      return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        },
      );
    }

    Widget _buildRow(WordPair pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    }

   
  }
}

class RandomUsername extends StatefulWidget {
  @override
  RandomUsernameState createState() => new RandomUsernameState();
}
