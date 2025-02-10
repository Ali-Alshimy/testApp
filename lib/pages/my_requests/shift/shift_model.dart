import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import 'shift_widget.dart' show ShiftWidget;
import 'package:flutter/material.dart';

class ShiftModel extends FlutterFlowModel<ShiftWidget> {
  ///  Local state fields for this page.

  String? timePeriod = '';

  String? status = '';

  String? startDate = '';

  String? endDate = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  DateTime? datePicked1;
  DateTime? datePicked2;
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
