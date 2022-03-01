/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'upvoty_icons.dart';
import 'upvoty_service.dart';
import 'upvoty_style.dart';

class UpvotyViewBoardHeader extends StatelessWidget {

  String _text;
  static const double _paddingHoriz = 13;
  static const double _paddingVert = 24;

  UpvotyViewBoardHeader(this._text);

  @override
  Widget build(BuildContext context) {
    UpvotyService service = Provider.of<UpvotyService>(context);
    UpvotyStyle style = service.style;
    return Stack(children: [
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: Container(
              alignment: Alignment.centerRight,
              child: Container(
                  width: service.style.size(_paddingHoriz) * 3,
                  height: service.style.size(_paddingVert) * 3,
                  padding: EdgeInsets.only(right: service.style.size(25)),
                  child: Center(
                      child: Icon(
                        UpvotyIcons.x,
                        size: service.style.text(16),
                        color: style.headerColor
                  ))))),
        GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {print("Back Arrow"), service.controller.navigateBack(context)},
            child: Container(
                alignment: Alignment.centerLeft,
                width: service.style.size(_paddingHoriz) * 3,
                child: Container(
                    width: service.style.size(_paddingHoriz) * 3,
                    height: service.style.size(_paddingVert) * 3,
                    padding: EdgeInsets.only(left: service.style.size(13)),
                    child: Center(
                        child: Icon(
                          UpvotyIcons.left_arrow,
                          size: service.style.text(16),
                          color: style.headerColor
                        ))))),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: service.style.size(_paddingVert),
          ),
          child: Text(_text,
              style: TextStyle(
                  color: style.headerColor,
                  fontWeight: FontWeight.w800,
                  fontFamily: service.style.fontFamily,
                  fontSize: service.style.text(16)))),
    ]);
  }
}
