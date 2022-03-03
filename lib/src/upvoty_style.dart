/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

class UpvotyStyle {
  static const double _stdDeviceWidth = 375;
  static const Color headerDef = Color(0xFF27002E);

  final double _deviceWidth;
  final double _textScaleFactor;

  final Color _textColor;

  String _fontFamily;

  UpvotyStyle(
      {MediaQueryData? mediaQueryData,
      Color textColor = headerDef,
      String fontFamily = 'Arial'})
      : _textScaleFactor = mediaQueryData?.textScaleFactor ?? 1.0,
        _deviceWidth = mediaQueryData?.size.width ?? 375,
        _textColor = textColor,
        _fontFamily = fontFamily;


  double size(double raw) => (raw * (_deviceWidth / _stdDeviceWidth));

  double text(double raw) =>
      (raw * (_deviceWidth / _stdDeviceWidth)) * _textScaleFactor;

  Color get textColor => _textColor;

  String get fontFamily => _fontFamily;

  set setName(String name) {
    _fontFamily = name;
  }

}
