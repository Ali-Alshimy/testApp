import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'shift_req_widget.dart' show ShiftReqWidget;
import 'package:flutter/material.dart';

class ShiftReqModel extends FlutterFlowModel<ShiftReqWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (shiftAssignment)] action in Button widget.
  ApiCallResponse? apiResultjyn;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
