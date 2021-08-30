import 'package:flutter/material.dart';

class SizeConfig {
  MediaQueryData? _queryData;
  static var screenWidth;
  static var screenHeight;

  init(BuildContext context) {
    _queryData = MediaQuery.of(context);

    screenWidth = _queryData!.size.width / 100;
    screenHeight = _queryData!.size.height / 100;
  }
}
