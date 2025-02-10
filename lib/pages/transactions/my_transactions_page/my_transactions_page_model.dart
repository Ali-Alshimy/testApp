import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/my_requests/shift_request_card/shift_request_card_widget.dart';
import '/pages/componets/my_requests/small_attandancerequest_card/small_attandancerequest_card_widget.dart';
import '/pages/componets/my_requests/small_card_annual/small_card_annual_widget.dart';
import '/pages/componets/my_requests/small_card_complaints/small_card_complaints_widget.dart';
import '/pages/componets/my_requests/small_card_fincliam/small_card_fincliam_widget.dart';
import '/pages/componets/my_requests/small_card_leave/small_card_leave_widget.dart';
import '/pages/componets/my_requests/small_card_loans/small_card_loans_widget.dart';
import '/pages/componets/my_requests/small_cardmisc/small_cardmisc_widget.dart';
import '/pages/componets/my_requests/small_cardovertime/small_cardovertime_widget.dart';
import '/pages/componets/my_requests/training_card/training_card_widget.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import 'my_transactions_page_widget.dart' show MyTransactionsPageWidget;
import 'package:flutter/material.dart';

class MyTransactionsPageModel
    extends FlutterFlowModel<MyTransactionsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SmallCardAnnual component.
  late SmallCardAnnualModel smallCardAnnualModel;
  // Model for SmallCardFincliam component.
  late SmallCardFincliamModel smallCardFincliamModel;
  // Model for SmallCardLeave component.
  late SmallCardLeaveModel smallCardLeaveModel;
  // Model for SmallCardLoans component.
  late SmallCardLoansModel smallCardLoansModel;
  // Model for SmallCardovertime component.
  late SmallCardovertimeModel smallCardovertimeModel;
  // Model for SmallAttandancerequestCard component.
  late SmallAttandancerequestCardModel smallAttandancerequestCardModel;
  // Model for ShiftRequestCard component.
  late ShiftRequestCardModel shiftRequestCardModel;
  // Model for TrainingCard component.
  late TrainingCardModel trainingCardModel;
  // Model for SmallCardmisc component.
  late SmallCardmiscModel smallCardmiscModel;
  // Model for SmallCardComplaints component.
  late SmallCardComplaintsModel smallCardComplaintsModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    smallCardAnnualModel = createModel(context, () => SmallCardAnnualModel());
    smallCardFincliamModel =
        createModel(context, () => SmallCardFincliamModel());
    smallCardLeaveModel = createModel(context, () => SmallCardLeaveModel());
    smallCardLoansModel = createModel(context, () => SmallCardLoansModel());
    smallCardovertimeModel =
        createModel(context, () => SmallCardovertimeModel());
    smallAttandancerequestCardModel =
        createModel(context, () => SmallAttandancerequestCardModel());
    shiftRequestCardModel = createModel(context, () => ShiftRequestCardModel());
    trainingCardModel = createModel(context, () => TrainingCardModel());
    smallCardmiscModel = createModel(context, () => SmallCardmiscModel());
    smallCardComplaintsModel =
        createModel(context, () => SmallCardComplaintsModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    smallCardAnnualModel.dispose();
    smallCardFincliamModel.dispose();
    smallCardLeaveModel.dispose();
    smallCardLoansModel.dispose();
    smallCardovertimeModel.dispose();
    smallAttandancerequestCardModel.dispose();
    shiftRequestCardModel.dispose();
    trainingCardModel.dispose();
    smallCardmiscModel.dispose();
    smallCardComplaintsModel.dispose();
    navBarModel.dispose();
  }
}
