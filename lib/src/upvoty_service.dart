
import 'package:flutter/material.dart';
import 'package:upvoty/src/upvoty_controller.dart';

import 'upvoty_presenter.dart';
import 'upvoty_style.dart';

class UpvotyService extends ChangeNotifier {

  late final UpvotyPresenter presenter;
  late final UpvotyController controller;
  final UpvotyStyle style;

  UpvotyService(this.style) {
    presenter = UpvotyPresenter(this);
    controller = UpvotyController(this);
  }
}