
import 'package:flutter/material.dart';
import 'controller.dart';

import 'presenter.dart';

class UpvotyService extends ChangeNotifier {

  late final UpvotyPresenter presenter;
  late final UpvotyController controller;
  final void Function(BuildContext) pressBack, pressX;

  UpvotyService(this.pressBack, this.pressX) {
    presenter = UpvotyPresenter(this);
    controller = UpvotyController();
  }

}