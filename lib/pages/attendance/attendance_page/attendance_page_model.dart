import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/attendance/time_attendance_history/time_attendance_history_widget.dart';
import '/pages/componets/attendance/time_attendance_missing/time_attendance_missing_widget.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import 'attendance_page_widget.dart' show AttendancePageWidget;
import 'package:flutter/material.dart';

class AttendancePageModel extends FlutterFlowModel<AttendancePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TimeAttendanceMissing component.
  late TimeAttendanceMissingModel timeAttendanceMissingModel;
  // Model for TimeAttendanceHistory component.
  late TimeAttendanceHistoryModel timeAttendanceHistoryModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    timeAttendanceMissingModel =
        createModel(context, () => TimeAttendanceMissingModel());
    timeAttendanceHistoryModel =
        createModel(context, () => TimeAttendanceHistoryModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    timeAttendanceMissingModel.dispose();
    timeAttendanceHistoryModel.dispose();
    navBarModel.dispose();
  }
}
