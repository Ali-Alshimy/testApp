import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import 'missing_attendance_page_widget.dart' show MissingAttendancePageWidget;
import 'package:flutter/material.dart';

class MissingAttendancePageModel
    extends FlutterFlowModel<MissingAttendancePageWidget> {
  ///  Local state fields for this page.

  bool? showData;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getEmployeeAttendance)] action in MissingAttendancePage widget.
  ApiCallResponse? missingAttendanceResponse;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
