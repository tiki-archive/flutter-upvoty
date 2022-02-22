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

  // bug reports hash 8128a9001510536547329897a929cfe81f2664e69183dbeee371ba5a8eeecfa1
  // feature req hash 18f45b1940dc76aa9b42853dbedac71a18cd998d992c5dad6ec695af09b2a983

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Upvoty().widget("18f45b1940dc76aa9b42853dbedac71a18cd998d992c5dad6ec695af09b2a983"),
        ),
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(child: Text('Not implemented.')),
//       ),
//     );
//   }
// }
