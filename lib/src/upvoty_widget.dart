/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UpvotyWidget extends StatefulWidget {

  final String _boardHash;

  UpvotyWidget(this._boardHash);

  @override
  State<StatefulWidget> createState() => _UpvotyWidgetState(_boardHash);

}

class _UpvotyWidgetState extends State<UpvotyWidget> {

  WebViewController? _controller;
  final String _boardHash;

  _UpvotyWidgetState(this._boardHash);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            zoomEnabled: false,
            onWebViewCreated: (controller) {
              this._controller = controller;
              _loadLocalHTML(context);
            }
        )
    );
  }

  void _loadLocalHTML(BuildContext context) async {
    String html = await DefaultAssetBundle.of(context).
    loadString('packages/upvoty/assets/upvoty.html');

    html = html.replaceFirst("\$BOARD_HASH\$", _boardHash);

    final url = Uri.dataFromString(
      html,
      mimeType: 'text/html',
      encoding: Encoding.getByName("utf-8"),
    ).toString();

    _controller?.loadUrl(url);
  }

}