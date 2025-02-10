import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import 'referral_details_page_widget.dart' show ReferralDetailsPageWidget;
import 'package:flutter/material.dart';

class ReferralDetailsPageModel
    extends FlutterFlowModel<ReferralDetailsPageWidget> {
  ///  Local state fields for this page.

  String hideText = 'show';

  bool showText = false;

  dynamic referralJop;

  bool? show;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (referralsJobTitlesList)] action in ReferralDetailsPage widget.
  ApiCallResponse? referral;
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
