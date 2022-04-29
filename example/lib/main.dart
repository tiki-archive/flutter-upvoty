import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:tiki_upvoty/tiki_upvoty.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) => print(
      '${record.time.toIso8601String()}: ${record.level.name} [${record.loggerName}] ${record.message}'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Container(
          padding: EdgeInsets.only(top: 250),
          child: Button()
        )
      ),
    );
  }
}

class Button extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TikiUpvoty up = TikiUpvoty();
    return Center(
      child: Column(
        children: [
          up.buttonSuggestions(),
          up.buttonBugs()
        ]
      ),
    );
  }
}