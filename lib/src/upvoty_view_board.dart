/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'upvoty_view_board_header.dart';

class UpvotyViewBoard extends StatefulWidget {

  final String _boardHash, _headerTitle;

  UpvotyViewBoard(this._headerTitle, this._boardHash);

  @override
  State<StatefulWidget> createState() =>
      _UpvotyViewBoard(_headerTitle, _boardHash);
}

class _UpvotyViewBoard extends State<UpvotyViewBoard> {

  WebViewController? _controller;
  final String _headerTitle, _boardHash;


  _UpvotyViewBoard(this._headerTitle, this._boardHash);

  @override
  void initState() {
    super.initState();

    // fixes errors when clicking button
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            height: MediaQuery.of(context).size.height * .85,
            child: Column(
              children: [
                UpvotyViewBoardHeader(_headerTitle),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        //padding: new EdgeInsets.fromLTRB(10, MediaQuery.of(context).size.height * .07, 10, 0),
                        child: WebView(
                            gestureRecognizers: Set()
                              ..add(
                                Factory<VerticalDragGestureRecognizer>(
                                      () => VerticalDragGestureRecognizer(),
                                ), // or null
                              ),
                            javascriptMode: JavascriptMode.unrestricted,
                            zoomEnabled: false,
                            onWebViewCreated: (controller) {
                              this._controller = controller;
                              _loadLocalHTML(context);
                            })),
                  )
                )
              ],
            )));
  }

  void _loadLocalHTML(BuildContext context) async {
    String html = await DefaultAssetBundle.of(context)
        .loadString('packages/tiki_upvoty/assets/upvoty.html');

    html = html.replaceFirst("\$BOARD_HASH\$", _boardHash);

    final url = Uri.dataFromString(
      html,
      mimeType: 'text/html',
      encoding: Encoding.getByName("utf-8"),
    ).toString();

    _controller?.loadUrl(url);
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
