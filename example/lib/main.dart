import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:upvoty/upvoty.dart';

import 'package:upvoty/src/upvoty_view_board.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) => print(
      '${record.time.toIso8601String()}: ${record.level.name} [${record.loggerName}] ${record.message}'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // bug reports hash 8128a9001510536547329897a929cfe81f2664e69183dbeee371ba5a8eeecfa1
  // feature req hash 18f45b1940dc76aa9b42853dbedac71a18cd998d992c5dad6ec695af09b2a983

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
    Upvoty up = Upvoty(
        style: UpvotyStyle(
          mediaQueryData: MediaQuery.of(context),
          fontFamily: "NunitoSans",
          headerColor: Color(0xFF27002E), // Tiki Purple
        )
    );
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