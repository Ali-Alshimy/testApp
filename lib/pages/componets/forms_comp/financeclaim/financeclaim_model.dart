import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'financeclaim_widget.dart' show FinanceclaimWidget;
import 'package:flutter/material.dart';

class FinanceclaimModel extends FlutterFlowModel<FinanceclaimWidget> {
  ///  Local state fields for this component.

  List<dynamic> claim = [];
  void addToClaim(dynamic item) => claim.add(item);
  void removeFromClaim(dynamic item) => claim.remove(item);
  void removeAtIndexFromClaim(int index) => claim.removeAt(index);
  void insertAtIndexInClaim(int index, dynamic item) =>
      claim.insert(index, item);
  void updateClaimAtIndex(int index, Function(dynamic) updateFn) =>
      claim[index] = updateFn(claim[index]);

  List<FFUploadedFile> attachment = [];
  void addToAttachment(FFUploadedFile item) => attachment.add(item);
  void removeFromAttachment(FFUploadedFile item) => attachment.remove(item);
  void removeAtIndexFromAttachment(int index) => attachment.removeAt(index);
  void insertAtIndexInAttachment(int index, FFUploadedFile item) =>
      attachment.insert(index, item);
  void updateAttachmentAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      attachment[index] = updateFn(attachment[index]);

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (claimRequest)] action in Button widget.
  ApiCallResponse? apiResultjg3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
