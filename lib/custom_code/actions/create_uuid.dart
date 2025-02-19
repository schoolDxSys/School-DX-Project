// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:uuid/uuid.dart';

Future<String> createUuid(String createRandomUuid) async {
  // Add your function code here!
  final uuid = Uuid();
  return uuid.v4(); // Generates a random UUID in the standard format
}
