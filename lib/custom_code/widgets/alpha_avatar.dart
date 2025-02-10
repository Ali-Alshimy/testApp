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

class AlphaAvatar extends StatefulWidget {
  const AlphaAvatar({
    super.key,
    required this.json,
    this.width,
    this.height,
  });

  final String json;
  final double? width;
  final double? height;

  @override
  State<AlphaAvatar> createState() => _AlphaAvatarState();
}

class _AlphaAvatarState extends State<AlphaAvatar> {
  @override
  Widget build(BuildContext context) {
    // Extract name from JSON
    List<String> nameList = widget.json.split(" ");
    String firstName = nameList[0];
    String lastName = "";

    if (nameList.length == 2) {
      lastName = nameList[1];
    }

    // Prepare display initials
    String initials = firstName[0].toUpperCase();
    if (lastName.isNotEmpty) {
      initials += lastName[0].toUpperCase();
    }

    return Container(
      width: widget.width ?? 100.0,
      height: widget.height ?? 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
      ),
      child: Center(
        child: Text(
          initials, // Display the first letter of the name
          style: TextStyle(
            fontSize: (widget.width ?? 40.0) * 0.3,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
