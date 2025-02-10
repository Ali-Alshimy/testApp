import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import '/pages/componets/profile/credit_card/credit_card_widget.dart';
import 'bank_details_page_widget.dart' show BankDetailsPageWidget;
import 'package:flutter/material.dart';

class BankDetailsPageModel extends FlutterFlowModel<BankDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CreditCard component.
  late CreditCardWidgetModel creditCardModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    creditCardModel = createModel(context, () => CreditCardWidgetModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    creditCardModel.dispose();
    navBarModel.dispose();
  }
}
