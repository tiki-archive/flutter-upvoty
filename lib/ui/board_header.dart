/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';

class UpvotyViewBoardHeader extends StatelessWidget {

  final String _text;

  static const double _paddingHoriz = 13;
  static const double _paddingVert = 24;

  UpvotyViewBoardHeader(this._text);

  @override
  Widget build(BuildContext context) {
    UpvotyService service = Provider.of<UpvotyService>(context);
    return Stack(children: [
      GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => service.pressX(context),
          child: Container(
              alignment: Alignment.centerRight,
              child: Container(
                  width: SizeProvider.instance.size(_paddingHoriz) * 3,
                  height: SizeProvider.instance.size(_paddingVert) * 3,
                  padding: EdgeInsets.only(right: SizeProvider.instance.size(25)),
                  child: Center(
                      child: Icon(
                        IconProvider.x,
                        size: SizeProvider.instance.text(16),
                        color: ColorProvider.tikiBlack
                  ))))),
        GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => service.pressBack(context),
            child: Container(
                alignment: Alignment.centerLeft,
                width: SizeProvider.instance.size(_paddingHoriz) * 3,
                child: Container(
                    width: SizeProvider.instance.size(_paddingHoriz) * 3,
                    height: SizeProvider.instance.size(_paddingVert) * 3,
                    padding: EdgeInsets.only(left: SizeProvider.instance.size(13)),
                    child: Center(
                        child: Icon(
                          IconProvider.arrow_left,
                          size: SizeProvider.instance.text(16),
                          color: ColorProvider.blue
                        ))))),
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: SizeProvider.instance.size(_paddingVert),
          ),
          child: Text(_text,
              style: TextStyle(
                  color: ColorProvider.tikiBlack,
                  fontWeight: FontWeight.w800,
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                  fontSize: SizeProvider.instance.text(16)))),
    ]);
  }
}
