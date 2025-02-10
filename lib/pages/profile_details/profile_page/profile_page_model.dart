import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import '/pages/componets/profile/profile_card_attachments/profile_card_attachments_widget.dart';
import '/pages/componets/profile/profile_card_bankinformation/profile_card_bankinformation_widget.dart';
import '/pages/componets/profile/profile_card_contactinfromation/profile_card_contactinfromation_widget.dart';
import '/pages/componets/profile/salary/deductions_salary/deductions_salary_widget.dart';
import '/pages/componets/profile/salary/earnings/earnings_widget.dart';
import '/pages/componets/profile/salary/profile_financial_salary/profile_financial_salary_widget.dart';
import '/pages/componets/profile/salary/total_salary/total_salary_widget.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  Local state fields for this page.

  String? month;

  String? netpay;

  String? deductions;

  String? salary;

  String? date;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for ProfileCardContactinfromation component.
  late ProfileCardContactinfromationModel profileCardContactinfromationModel;
  // Model for ProfileCardBankinformation component.
  late ProfileCardBankinformationModel profileCardBankinformationModel;
  // Model for ProfileCardAttachments component.
  late ProfileCardAttachmentsModel profileCardAttachmentsModel;
  // State field(s) for DropDownYear widget.
  String? dropDownYearValue;
  FormFieldController<String>? dropDownYearValueController;
  // State field(s) for DropDownMonth widget.
  String? dropDownMonthValue;
  FormFieldController<String>? dropDownMonthValueController;
  // Model for ProfileFinancialSalary component.
  late ProfileFinancialSalaryModel profileFinancialSalaryModel;
  // Model for Earnings component.
  late EarningsModel earningsModel;
  // Model for DeductionsSalary component.
  late DeductionsSalaryModel deductionsSalaryModel;
  // Model for totalSalary component.
  late TotalSalaryModel totalSalaryModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    profileCardContactinfromationModel =
        createModel(context, () => ProfileCardContactinfromationModel());
    profileCardBankinformationModel =
        createModel(context, () => ProfileCardBankinformationModel());
    profileCardAttachmentsModel =
        createModel(context, () => ProfileCardAttachmentsModel());
    profileFinancialSalaryModel =
        createModel(context, () => ProfileFinancialSalaryModel());
    earningsModel = createModel(context, () => EarningsModel());
    deductionsSalaryModel = createModel(context, () => DeductionsSalaryModel());
    totalSalaryModel = createModel(context, () => TotalSalaryModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    profileCardContactinfromationModel.dispose();
    profileCardBankinformationModel.dispose();
    profileCardAttachmentsModel.dispose();
    profileFinancialSalaryModel.dispose();
    earningsModel.dispose();
    deductionsSalaryModel.dispose();
    totalSalaryModel.dispose();
    navBarModel.dispose();
  }
}
