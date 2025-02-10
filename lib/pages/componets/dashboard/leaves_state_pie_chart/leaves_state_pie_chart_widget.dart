import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'leaves_state_pie_chart_model.dart';
export 'leaves_state_pie_chart_model.dart';

class LeavesStatePieChartWidget extends StatefulWidget {
  const LeavesStatePieChartWidget({super.key});

  @override
  State<LeavesStatePieChartWidget> createState() =>
      _LeavesStatePieChartWidgetState();
}

class _LeavesStatePieChartWidgetState extends State<LeavesStatePieChartWidget> {
  late LeavesStatePieChartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeavesStatePieChartModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: LeaveTypesPercentageForPieChartCall.call(
        apiKey: currentUserData?.apiKey,
        apiSecret: currentUserData?.apiSecret,
        baseUrl: FFAppState().baseURL,
        userId: currentUserData?.id,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: 85.0,
              height: 85.0,
              child: SpinKitRipple(
                color: Color(0xFF002855),
                size: 85.0,
              ),
            ),
          );
        }
        final columnLeaveTypesPercentageForPieChartResponse = snapshot.data!;

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Builder(
              builder: (context) {
                final leavesState = getJsonField(
                  columnLeaveTypesPercentageForPieChartResponse.jsonBody,
                  r'''$.message''',
                ).toList();

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children:
                        List.generate(leavesState.length, (leavesStateIndex) {
                      final leavesStateItem = leavesState[leavesStateIndex];
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 7.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.38,
                          height: MediaQuery.sizeOf(context).height * 0.27,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).info,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 2.0),
                                child: CircularPercentIndicator(
                                  percent: valueOrDefault<double>(
                                    functions.getDynamicEquationResult(functions
                                        .convertDoubleToInt(
                                            valueOrDefault<double>(
                                          getJsonField(
                                            leavesStateItem,
                                            r'''$.percentage''',
                                          ),
                                          0.0,
                                        ))
                                        .toDouble()),
                                    0.0,
                                  ),
                                  radius:
                                      MediaQuery.sizeOf(context).width * 0.105,
                                  lineWidth: 8.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor: () {
                                    if (valueOrDefault<int>(
                                          functions.convertDoubleToInt(
                                              valueOrDefault<double>(
                                            getJsonField(
                                              leavesStateItem,
                                              r'''$.percentage''',
                                            ),
                                            0.0,
                                          )),
                                          0,
                                        ) >=
                                        75) {
                                      return const Color(0xE7C31B1B);
                                    } else if (valueOrDefault<int>(
                                          functions.convertDoubleToInt(
                                              valueOrDefault<double>(
                                            getJsonField(
                                              leavesStateItem,
                                              r'''$.percentage''',
                                            ),
                                            0.0,
                                          )),
                                          0,
                                        ) <
                                        75) {
                                      return const Color(0xFF38B000);
                                    } else if (valueOrDefault<int>(
                                          functions.convertDoubleToInt(
                                              valueOrDefault<double>(
                                            getJsonField(
                                              leavesStateItem,
                                              r'''$.percentage''',
                                            ),
                                            0.0,
                                          )),
                                          0,
                                        ) <=
                                        50) {
                                      return const Color(0xFF5B7F95);
                                    } else {
                                      return const Color(0xE7C31B1B);
                                    }
                                  }(),
                                  backgroundColor: const Color(0x6DD9E6F2),
                                  center: Text(
                                    '${functions.convertDoubleToInt(valueOrDefault<double>(
                                          getJsonField(
                                            leavesStateItem,
                                            r'''$.percentage''',
                                          ),
                                          0.0,
                                        )).toString()}%',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily),
                                        ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 4.0, 5.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        getJsonField(
                                          leavesStateItem,
                                          r'''$.leave_type''',
                                        )?.toString(),
                                        'Leaves ',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
