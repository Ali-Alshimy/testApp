import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import '/pages/componets/profile/attachment_list/attachment_list_widget.dart';
import 'attachments_page_widget.dart' show AttachmentsPageWidget;
import 'package:flutter/material.dart';

class AttachmentsPageModel extends FlutterFlowModel<AttachmentsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AttachmentList component.
  late AttachmentListModel attachmentListModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    attachmentListModel = createModel(context, () => AttachmentListModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    attachmentListModel.dispose();
    navBarModel.dispose();
  }
}
