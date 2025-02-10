import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'attendance_bottom_sheet_widget.dart' show AttendanceBottomSheetWidget;
import 'package:flutter/material.dart';

class AttendanceBottomSheetModel
    extends FlutterFlowModel<AttendanceBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (employeeCheckInAndOut)] action in Button widget.
  ApiCallResponse? checkIn;
  // Stores action output result for [Backend Call - API (getEmployeeCheckin)] action in Button widget.
  ApiCallResponse? checkInAndOUt;
  // Stores action output result for [Backend Call - API (employeeCheckInAndOut)] action in Button widget.
  ApiCallResponse? checkOut;
  // Stores action output result for [Backend Call - API (getEmployeeCheckin)] action in Button widget.
  ApiCallResponse? checkInAndOUt2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
