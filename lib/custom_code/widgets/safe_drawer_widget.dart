// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/other/drawer/drawer_widget.dart';

class SafeDrawerWidget extends StatefulWidget {
  const SafeDrawerWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<SafeDrawerWidget> createState() => _SafeDrawerWidgetState();
}

class _SafeDrawerWidgetState extends State<SafeDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    // SafeArea
    // 端末のエッジ部を考慮した配置をしてくれる
    return SafeArea(
      child: DrawerWidget(),
    );
  }
}
