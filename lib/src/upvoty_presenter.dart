
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';
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
    Navigator.of(context).pop();

    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: ColorProvider.greyTwo,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(SizeProvider.instance.size(40)))),
        builder: (BuildContext context) => render(title, boardHash));
  }
}