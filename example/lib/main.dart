import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:upvoty/upvoty.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) => print(
      '${record.time.toIso8601String()}: ${record.level.name} [${record.loggerName}] ${record.message}'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  // feature req hash 18f45b1940dc76aa9b42853dbedac71a18cd998d992c5dad6ec695af09b2a983

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // TODO create the button that will pop the widgets
          // one button for bug report and one for feature
          child: Upvoty().bugReportBtn()
      ),
    )
    );
  }
}