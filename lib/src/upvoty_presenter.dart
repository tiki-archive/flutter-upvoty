
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:style/style.dart';
import 'upvoty_service.dart';
import 'upvoty_view_board.dart';

class UpvotyPresenter {

  final UpvotyService _service;

  UpvotyPresenter(this._service);

  ChangeNotifierProvider<UpvotyService> render(String title, String boardHash) {
    return ChangeNotifierProvider.value(
        value: _service, child: UpvotyViewBoard(title, boardHash));
  }

  Future<void> showModal(BuildContext context, String title, String boardHash) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: ColorProvider.greyTwo,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(_service.style.size(40)))),
        builder: (BuildContext context) => render(title, boardHash));
  }
}