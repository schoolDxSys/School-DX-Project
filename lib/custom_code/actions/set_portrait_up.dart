// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
// この下の部分をコピペする

import 'package:flutter/services.dart';

Future setPortraitUp() async {
  // Use to set portraitUp
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
