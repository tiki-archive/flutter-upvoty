/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:style/style.dart';
import 'package:flutter/cupertino.dart';
import 'src/upvoty_service.dart';
import 'src/upvoty_style.dart';
import 'src/upvoty_widget_button.dart';

export 'src/upvoty_style.dart';

class Upvoty {
  final UpvotyService _service;

  Upvoty(
      {UpvotyStyle? style,
      Function(BuildContext)? pressBack,
      Function(BuildContext)? pressX})
      : _service = UpvotyService(
            style ?? UpvotyStyle(),
            pressBack ?? (context) => Navigator.of(context).pop(),
            pressX ?? (context) => Navigator.of(context).pop());

  buttonSuggestions() => UpvotyWidgetButton(
      _service,
      "Request a feature!",
      IconProvider.light_bulb,
      "18f45b1940dc76aa9b42853dbedac71a18cd998d992c5dad6ec695af09b2a983");

  buttonBugs() => UpvotyWidgetButton(
      _service,
      "Report a bug!",
      IconProvider.bug_report,
      "8128a9001510536547329897a929cfe81f2664e69183dbeee371ba5a8eeecfa1");
}
