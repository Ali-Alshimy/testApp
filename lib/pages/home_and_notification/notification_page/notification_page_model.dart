import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import 'notification_page_widget.dart' show NotificationPageWidget;
import 'package:flutter/material.dart';

class NotificationPageModel extends FlutterFlowModel<NotificationPageWidget> {
  ///  Local state fields for this page.

  bool? readAll;

  String show = 'All';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (markNotificationsAsRead)] action in Button widget.
  ApiCallResponse? apiResultoe1;
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
