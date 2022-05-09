/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:tiki_style/tiki_style.dart';
import 'package:flutter/cupertino.dart';
import 'service.dart';
import 'ui/button.dart';

class TikiUpvoty {
  final UpvotyService _service;

  TikiUpvoty(
      {Function(BuildContext)? pressBack,
      Function(BuildContext)? pressX})
      : _service = UpvotyService(
            pressBack ?? (context) => Navigator.of(context).pop(),
            pressX ?? (context) => Navigator.of(context).pop());

  buttonSuggestions() => UpvotyWidgetButton(
      _service,
      "Request a feature!",
      IconProvider.bulb,
      "18f45b1940dc76aa9b42853dbedac71a18cd998d992c5dad6ec695af09b2a983");

  buttonBugs() => UpvotyWidgetButton(
      _service,
      "Report a bug!",
      IconProvider.bug,
      "8128a9001510536547329897a929cfe81f2664e69183dbeee371ba5a8eeecfa1");
}
