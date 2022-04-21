import 'package:flutter/material.dart';

import 'upvoty_icons.dart';
import 'upvoty_service.dart';

class UpvotyWidgetButton extends StatelessWidget {

  UpvotyService _service;
  IconData _icon;
  String _title, _boardHash;

  // icon-alert is good for bug (maybe no color)
  // icon-act-plus for new feature

  UpvotyWidgetButton(this._service, this._title, this._icon, this._boardHash);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _service.presenter.showModal(context, _title, _boardHash),
        child: Container(
            padding: EdgeInsets.symmetric(
                vertical: _service.style.size(17),
                horizontal: _service.style.size(17)),
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0), //ConfigColor.greyTwo,
              borderRadius: BorderRadius.circular(_service.style.size(12)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    _icon,
                    color: _service.style.textColor,
                    size: _service.style.text(24),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: _service.style.size(10))),
                  Expanded(
                      child: Text(_title,
                          style: TextStyle(
                              fontSize: _service.style.text(12),
                              fontFamily: _service.style.fontFamily,
                              fontWeight: FontWeight.bold))),
                  Icon(
                    UpvotyIcons.right_arrow,
                    color: _service.style.textColor,
                    size: _service.style.text(16),
                  )
                ])));
  }
}
