import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'training_request_widget.dart' show TrainingRequestWidget;
import 'package:flutter/material.dart';

class TrainingRequestModel extends FlutterFlowModel<TrainingRequestWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (trainingRequest)] action in Button widget.
  ApiCallResponse? apiResult1uf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
