import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pie_chart_for_home_page_model.dart';
export 'pie_chart_for_home_page_model.dart';

class PieChartForHomePageWidget extends StatefulWidget {
  const PieChartForHomePageWidget({super.key});

  @override
  State<PieChartForHomePageWidget> createState() =>
      _PieChartForHomePageWidgetState();
}

class _PieChartForHomePageWidgetState extends State<PieChartForHomePageWidget> {
  late PieChartForHomePageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PieChartForHomePageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
