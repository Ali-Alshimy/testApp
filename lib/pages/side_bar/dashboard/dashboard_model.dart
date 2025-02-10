import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/componets/dashboard/leaves_state_pie_chart/leaves_state_pie_chart_widget.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  bool? type = false;

  bool? show;

  String? changeData;

  String week = 'week 1';

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (leaveTypesPercentageForPieChart)] action in dashboard widget.
  ApiCallResponse? leavesForDashboard;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for leavesStatePieChart component.
  late LeavesStatePieChartModel leavesStatePieChartModel;
  // Stores action output result for [Backend Call - API (leaveBalance)] action in Button widget.
  ApiCallResponse? apiResult11y;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    leavesStatePieChartModel =
        createModel(context, () => LeavesStatePieChartModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    leavesStatePieChartModel.dispose();
    navBarModel.dispose();
  }
}
