import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/my_requests/attendance_card/attendance_card_widget.dart';
import '/pages/componets/my_requests/card_complaints/card_complaints_widget.dart';
import '/pages/componets/my_requests/card_finclaims_card/card_finclaims_card_widget.dart';
import '/pages/componets/my_requests/card_leaves/card_leaves_widget.dart';
import '/pages/componets/my_requests/card_loans/card_loans_widget.dart';
import '/pages/componets/my_requests/card_misc/card_misc_widget.dart';
import '/pages/componets/my_requests/card_overtime/card_overtime_widget.dart';
import '/pages/componets/my_requests/card_training/card_training_widget.dart';
import '/pages/componets/my_requests/card_vacations/card_vacations_widget.dart';
import '/pages/componets/my_requests/shift_card/shift_card_widget.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import 'newtransaction_page_widget.dart' show NewtransactionPageWidget;
import 'package:flutter/material.dart';

class NewtransactionPageModel
    extends FlutterFlowModel<NewtransactionPageWidget> {
  ///  Local state fields for this page.

  bool? changeStatus;

  dynamic test;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (transactionStats)] action in NewtransactionPage widget.
  ApiCallResponse? transaction;
  // Model for CardVacations component.
  late CardVacationsModel cardVacationsModel;
  // Model for CardLeaves component.
  late CardLeavesModel cardLeavesModel;
  // Model for CardFinclaimsCard component.
  late CardFinclaimsCardModel cardFinclaimsCardModel;
  // Model for CardOvertime component.
  late CardOvertimeModel cardOvertimeModel;
  // Model for CardLoans component.
  late CardLoansModel cardLoansModel;
  // Model for CardTraining component.
  late CardTrainingModel cardTrainingModel;
  // Model for AttendanceCard component.
  late AttendanceCardModel attendanceCardModel;
  // Model for ShiftCard component.
  late ShiftCardModel shiftCardModel;
  // Model for CardMisc component.
  late CardMiscModel cardMiscModel;
  // Model for CardComplaints component.
  late CardComplaintsModel cardComplaintsModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    cardVacationsModel = createModel(context, () => CardVacationsModel());
    cardLeavesModel = createModel(context, () => CardLeavesModel());
    cardFinclaimsCardModel =
        createModel(context, () => CardFinclaimsCardModel());
    cardOvertimeModel = createModel(context, () => CardOvertimeModel());
    cardLoansModel = createModel(context, () => CardLoansModel());
    cardTrainingModel = createModel(context, () => CardTrainingModel());
    attendanceCardModel = createModel(context, () => AttendanceCardModel());
    shiftCardModel = createModel(context, () => ShiftCardModel());
    cardMiscModel = createModel(context, () => CardMiscModel());
    cardComplaintsModel = createModel(context, () => CardComplaintsModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    cardVacationsModel.dispose();
    cardLeavesModel.dispose();
    cardFinclaimsCardModel.dispose();
    cardOvertimeModel.dispose();
    cardLoansModel.dispose();
    cardTrainingModel.dispose();
    attendanceCardModel.dispose();
    shiftCardModel.dispose();
    cardMiscModel.dispose();
    cardComplaintsModel.dispose();
    navBarModel.dispose();
  }
}
