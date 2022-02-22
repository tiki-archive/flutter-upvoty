/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'src/ui/upvoty_bug_rep_btn.dart';
import 'src/ui/upvoty_widget.dart';

class Upvoty {

  Widget widget(String boardHash) => UpvotyWidget(boardHash);

  Widget bugReportBtn() => UpvotyBugReportBtn();

  // TODO
  //Widget featureReqBtn => Container()
}