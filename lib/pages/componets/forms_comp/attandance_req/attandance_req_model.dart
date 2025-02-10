import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'attandance_req_widget.dart' show AttandanceReqWidget;
import 'package:flutter/material.dart';

class AttandanceReqModel extends FlutterFlowModel<AttandanceReqWidget> {
  ///  Local state fields for this component.

  String? fromDate = '';

  String? toDate = '';

  String? halfDayDate = '';

  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (attendanceRequest)] action in Button widget.
  ApiCallResponse? apiResult0bf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
