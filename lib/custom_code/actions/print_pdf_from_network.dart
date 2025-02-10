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
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';

import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart' as pdfLib;

import 'package:http/http.dart' as http;

Future<void> printPdfFromNetwork(
    BuildContext context, String url, bool isDownload, String name) async {
  Map<String, String> headers = {
    'Authorization':
        'token ${FFAppState().UserData.apiKey}:${FFAppState().UserData.apiSecret}',
    'Content-Type': 'application/json',
  };
  http.Response response = await http.get(Uri.parse(url), headers: headers);
  var pdfData = response.bodyBytes;
  if (isDownload) {
    final fileName = '${name}.pdf'; // Desired file name
    Directory? downloadsDirectory = await DownloadsPath.downloadsDirectory();
    String? downloadsDirectoryPath =
        (await DownloadsPath.downloadsDirectory())?.path;
    // final directory = await getDownloadsDirectory();
    final filePath = '${downloadsDirectoryPath}/$fileName';
    File(filePath).writeAsBytes(pdfData);
    var confirmDialogResponse = await showDialog<bool>(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Downloaded'),
              content: Text('File Downloaded in: ${filePath}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext, true),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        ) ??
        false;
  } else {
    await Printing.layoutPdf(
        onLayout: (pdfLib.PdfPageFormat format) async => pdfData);
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
