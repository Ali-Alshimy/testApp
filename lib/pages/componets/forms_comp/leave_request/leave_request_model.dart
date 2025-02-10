import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'leave_request_widget.dart' show LeaveRequestWidget;
import 'package:flutter/material.dart';

class LeaveRequestModel extends FlutterFlowModel<LeaveRequestWidget> {
  ///  Local state fields for this component.

  String balance = '';

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for leavestype widget.
  String? leavestypeValue;
  FormFieldController<String>? leavestypeValueController;
  // Stores action output result for [Backend Call - API (availableLeaveBalance)] action in leavestype widget.
  ApiCallResponse? typeBalance;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (leaveRequest)] action in Button widget.
  ApiCallResponse? apiResultcki;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
