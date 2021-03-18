// @dart=2.9
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'loading.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "My First App",
      theme: ThemeData(primaryColor: Colors.white),
      home: LoadingPage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
      ],
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}

class RandomWordsState extends State {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);
  final _saved = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: [IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      print("YZZ _saved.size = $_saved");
      final tiles = _saved.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asCamelCase,
            style: _biggerFont,
          ),
        );
      });
      print("YZZ tiles.size = $tiles");
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text("save suggestions"),
        ),
        body: ListView(children: divided),
      );
    }));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asCamelCase,
        style: _biggerFont,
      ),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
