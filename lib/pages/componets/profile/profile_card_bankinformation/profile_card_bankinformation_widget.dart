import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'profile_card_bankinformation_model.dart';
export 'profile_card_bankinformation_model.dart';

class ProfileCardBankinformationWidget extends StatefulWidget {
  const ProfileCardBankinformationWidget({super.key});

  @override
  State<ProfileCardBankinformationWidget> createState() =>
      _ProfileCardBankinformationWidgetState();
}

class _ProfileCardBankinformationWidgetState
    extends State<ProfileCardBankinformationWidget> {
  late ProfileCardBankinformationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileCardBankinformationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        final localAuth = LocalAuthentication();
        bool isBiometricSupported = await localAuth.isDeviceSupported();

        if (isBiometricSupported) {
          try {
            _model.accountBank = await localAuth.authenticate(
                localizedReason: FFLocalizations.of(context).getText(
              '6vb67a05' /* This page have it is confident... */,
            ));
          } on PlatformException {
            _model.accountBank = false;
          }
          safeSetState(() {});
        }

        if (_model.accountBank) {
          context.pushNamed('BankDetailsPage');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed To Access This Page',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }

        safeSetState(() {});
      },
      child: Container(
        width: 159.0,
        height: 121.0,
        decoration: BoxDecoration(
          color: const Color(0xFFE8E9F3),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: const Color(0x27000000),
            width: 0.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0267C1),
                    shape: BoxShape.circle,
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: FaIcon(
                      FontAwesomeIcons.landmark,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'q56mz5zw' /* Bank
information */
                      ,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
