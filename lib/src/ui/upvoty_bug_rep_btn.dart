import 'package:flutter/material.dart';
import '../ui/upvoty_widget.dart';

class UpvotyBugReportBtn extends StatelessWidget{
  final _hash = '8128a9001510536547329897a929cfe81f2664e69183dbeee371ba5a8eeecfa1';

  // TODO match app style
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => UpvotyWidget(_hash))
        ),
        child: Text('Open Bug Report'));
  }

}