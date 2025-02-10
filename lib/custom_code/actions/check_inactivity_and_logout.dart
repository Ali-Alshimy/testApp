// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:rxdart/rxdart.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';

Future<void> checkInactivityAndLogout(BuildContext context) async {
  bool isUserActive = false;
  bool shouldContinue = true;

  while (shouldContinue && context.mounted) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            isUserActive = true;
            Navigator.of(context).pop();
            // Reset the check by continuing the loop
            shouldContinue = true;
          },
          onPanUpdate: (_) {
            isUserActive = true;
            Navigator.of(context).pop();
            // Reset the check by continuing the loop
            shouldContinue = true;
          },
          child: Container(
            color: Colors.transparent,
          ),
        );
      },
    );

    // Wait for 1 hour
    await Future.delayed(Duration(seconds: 3600));

    if (!isUserActive && context.mounted) {
      shouldContinue = false; // Stop the loop
      // Clear any stored auth data if needed
      // FFAppState().yourAuthToken = '';  // Uncomment and modify as needed

      // Navigate directly to login page without showing warning
      context.goNamed(
        'loginPage', // Replace with your actual login page name
        extra: <String, dynamic>{
          'from': 'timeout',
        },
      );
    }

    isUserActive = false;
  }
}

Future<void> startInactivityCheck(BuildContext context) async {
  try {
    await checkInactivityAndLogout(context);
  } catch (e) {
    print('Error in inactivity check: $e');
  }
}
