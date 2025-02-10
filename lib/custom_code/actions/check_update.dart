// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:version_check/version_check.dart';

Future<void> checkUpdate(BuildContext context, String versionNumber) async {
  var latestVersion = versionNumber;
  final appStoreLink = "https://apps.apple.com/eg/app/talentio/id6711350503";
  final playStoreLink =
      "https://play.google.com/store/apps/details?id=golivesolution.talentio";

  final isAndroid = Theme.of(context).platform == TargetPlatform.android;
  final storeLink = isAndroid ? playStoreLink : appStoreLink;

  final isArabic = Localizations.localeOf(context).languageCode == "ar";

  final title =
      isArabic ? "تحديث جديد متوفر Talentio" : "Talentio New Update Available";
  final content = isArabic
      ? "يوجد إصدار جديد للتطبيق. هل ترغب في التحديث الآن؟"
      : "A new version of the app is available. Would you like to update now?";
  final updateText = isArabic ? "تحديث" : "Update";
  final closeText = isArabic ? "إغلاق" : "Close";
  final errorText = isArabic
      ? "تعذر فتح المتجر. حاول لاحقًا."
      : "Unable to open the store. Please try again later.";

  if (versionNumber != latestVersion) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              child: Text(updateText),
              onPressed: () async {
                // ignore: deprecated_member_use
                if (await canLaunch(storeLink)) {
                  // ignore: deprecated_member_use
                  await launch(storeLink);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(errorText)),
                  );
                }
              },
            ),
            TextButton(
              child: Text(closeText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
