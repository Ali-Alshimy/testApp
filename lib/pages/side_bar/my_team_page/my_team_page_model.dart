import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import 'my_team_page_widget.dart' show MyTeamPageWidget;
import 'package:flutter/material.dart';

class MyTeamPageModel extends FlutterFlowModel<MyTeamPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> myTeamList = [];
  void addToMyTeamList(dynamic item) => myTeamList.add(item);
  void removeFromMyTeamList(dynamic item) => myTeamList.remove(item);
  void removeAtIndexFromMyTeamList(int index) => myTeamList.removeAt(index);
  void insertAtIndexInMyTeamList(int index, dynamic item) =>
      myTeamList.insert(index, item);
  void updateMyTeamListAtIndex(int index, Function(dynamic) updateFn) =>
      myTeamList[index] = updateFn(myTeamList[index]);

  ///  State fields for stateful widgets in this page.

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
