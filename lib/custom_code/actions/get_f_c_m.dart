// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';

/// Get FCM token for push notifications
/// Returns the token as String or null if not available
Future getFCM() async {
  final _fcm = FirebaseMessaging.instance;

  // Request permissions from user iOS requirement
  // Android permissions are handled during app installation
  await _fcm.requestPermission(
    alert: true, // Show notification when received
    badge: true, // Show app icon badges
    sound: true, // Play sound when notification received
  );

  // Get the unique device token
  final token = await _fcm.getToken();

  // Store token in app state if available
  if (token != null) {
    FFAppState().fcmToken = token;
  }

  return token;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
