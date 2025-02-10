// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

bool isRTL(BuildContext context) {
  final locale = Localizations.localeOf(context);
  return locale.languageCode == 'ar';
}

class Swap extends StatefulWidget {
  const Swap({
    Key? key,
    this.width,
    this.height,
    required this.start,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() start;

  @override
  _SwapState createState() => _SwapState();
}

class _SwapState extends State<Swap> {
  late bool _isRtl;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isRtl = isRTL(context);
  }

  @override
  Widget build(BuildContext context) {
    return FFAppState().drawer == 0
        ? Container()
        : GestureDetector(
            onHorizontalDragEnd: (details) {
              // Determine the swipe direction based on RTL setting
              bool isClosingSwipe = _isRtl
                  ? details.primaryVelocity! > 0 // In RTL, swipe right to close
                  : details.primaryVelocity! < 0; // In LTR, swipe left to close

              if (isClosingSwipe) {
                FFAppState().update(() {
                  FFAppState().drawer = 0;
                });
                setState(() {});
                widget.start();
              }
            },
          );
  }
}
