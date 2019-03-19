import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Username Genarator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: RandomUsername(),
    );
  }
}

class RandomUsernameState extends State<RandomUsername> {

  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved =  new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0, fontFamily: "arial");

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Username Generator'),
        ),
        body: _buildSuggestions(),
      );
    }

    Widget _buildSuggestions() {
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
      final bool alreadySaved = _saved.contains(pair);

      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite: Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if(alreadySaved){
              _saved.remove(pair);
            }
            else{
              _saved.add(pair);
            }
          });
        },
      );
    }
}

class RandomUsername extends StatefulWidget {
  @override
  RandomUsernameState createState() => new RandomUsernameState();
}
