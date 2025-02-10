// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<bool> checkDeveloperMode() async {
  bool jailbroken = await FlutterJailbreakDetection.jailbroken;
  bool developerMode =
      await FlutterJailbreakDetection.developerMode; // android only.
  return developerMode;
}
