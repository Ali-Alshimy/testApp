import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  Local state fields for this page.

  bool show = false;

  bool leaves = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool biometricLogin = false;
  // Stores action output result for [Backend Call - API (loginApi)] action in loginPage widget.
  ApiCallResponse? apiResultkp0;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for BaseURL widget.
  FocusNode? baseURLFocusNode;
  TextEditingController? baseURLTextController;
  String? Function(BuildContext, String?)? baseURLTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'f6mq0kne' /* This field is required */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '9bk4ydxj' /*  Please enter a valid email ad... */,
      );
    }
    if (val.length > 320) {
      return FFLocalizations.of(context).getText(
        'nj932jxq' /* Email max 320 characters */,
      );
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in emailAddress widget.
  bool? validateEmail;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'a5x66ka0' /* This field is required */,
      );
    }

    if (val.length < 8) {
      return FFLocalizations.of(context).getText(
        'n4sr14zo' /* Password must have 8 character... */,
      );
    }
    if (val.length > 50) {
      return FFLocalizations.of(context).getText(
        'a0mygk8m' /* Password max 320 characters */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in password widget.
  bool? validatePassword;
  // Stores action output result for [Custom Action - uuid] action in Button widget.
  String? devicId;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validateEmailAndPassword;
  // Stores action output result for [Backend Call - API (loginApi)] action in Button widget.
  ApiCallResponse? login;

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    baseURLFocusNode?.dispose();
    baseURLTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
