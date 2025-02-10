import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'complaints_widget.dart' show ComplaintsWidget;
import 'package:flutter/material.dart';

class ComplaintsModel extends FlutterFlowModel<ComplaintsWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for GrievanceParty widget.
  String? grievancePartyValue;
  FormFieldController<String>? grievancePartyValueController;
  // State field(s) for GrievanceAgainst widget.
  String? grievanceAgainstValue;
  FormFieldController<String>? grievanceAgainstValueController;
  // State field(s) for GrievanceType widget.
  String? grievanceTypeValue;
  FormFieldController<String>? grievanceTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (createEmployeeGrievance)] action in Button widget.
  ApiCallResponse? apiResultqnu;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
