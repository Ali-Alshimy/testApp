import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'time_attendance_missing_model.dart';
export 'time_attendance_missing_model.dart';

class TimeAttendanceMissingWidget extends StatefulWidget {
  const TimeAttendanceMissingWidget({super.key});

  @override
  State<TimeAttendanceMissingWidget> createState() =>
      _TimeAttendanceMissingWidgetState();
}

class _TimeAttendanceMissingWidgetState
    extends State<TimeAttendanceMissingWidget> {
  late TimeAttendanceMissingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeAttendanceMissingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: const Color(0xFFE8E9F3),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color(0x27000000),
          width: 0.0,
        ),
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: const AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 5.0, 0.0),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  shape: BoxShape.circle,
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: const Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    Icons.fingerprint_sharp,
                    color: Color(0xFF004BA8),
                    size: 25.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'lsgczgx1' /* Missing
Attendance */
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
    );
  }
}
