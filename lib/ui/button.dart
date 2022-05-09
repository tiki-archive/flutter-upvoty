import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';

class UpvotyWidgetButton extends StatelessWidget {

  final UpvotyService _service;
  final IconData _icon;
  final String _title, _boardHash;

  // icon-alert is good for bug (maybe no color)
  // icon-act-plus for new feature

  UpvotyWidgetButton(this._service, this._title, this._icon, this._boardHash);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _service.presenter.showModal(context, _title, _boardHash),
        child: Container(
            padding: EdgeInsets.symmetric(
                vertical: SizeProvider.instance.size(17),
                horizontal: SizeProvider.instance.size(17)),
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0), //ConfigColor.greyTwo,
              borderRadius: BorderRadius.circular(SizeProvider.instance.size(12)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    _icon,
                    color: ColorProvider.tikiBlack,
                    size: SizeProvider.instance.text(24),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: SizeProvider.instance.size(10))),
                  Expanded(
                      child: Text(_title,
                          style: TextStyle(
                              fontSize: SizeProvider.instance.text(12),
                              fontFamily: TextProvider.familyNunitoSans,
                              package: 'tiki_style',
                              fontWeight: FontWeight.bold))),
                  Icon(
                    IconProvider.arrow_right,
                    size: SizeProvider.instance.text(16),
                  )
                ])));
  }
}
