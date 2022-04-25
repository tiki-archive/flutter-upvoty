
import 'package:flutter/material.dart';
import 'package:upvoty/src/upvoty_controller.dart';

import 'upvoty_presenter.dart';
import 'upvoty_style.dart';

class UpvotyService extends ChangeNotifier {

  late final UpvotyPresenter presenter;
  late final UpvotyController controller;
  final UpvotyStyle style;
  final void Function(BuildContext) pressBack, pressX;

  UpvotyService(this.style, this.pressBack, this.pressX) {
    presenter = UpvotyPresenter(this);
    controller = UpvotyController(this);
  }

}