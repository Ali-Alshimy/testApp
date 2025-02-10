import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import '/pages/componets/response_messages/successful_message/successful_message_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'missing_attendance_page_model.dart';
export 'missing_attendance_page_model.dart';

class MissingAttendancePageWidget extends StatefulWidget {
  const MissingAttendancePageWidget({super.key});

  @override
  State<MissingAttendancePageWidget> createState() =>
      _MissingAttendancePageWidgetState();
}

class _MissingAttendancePageWidgetState
    extends State<MissingAttendancePageWidget> {
  late MissingAttendancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MissingAttendancePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkinternetConnection(
        context,
      );
      _model.missingAttendanceResponse = await GetEmployeeAttendanceCall.call(
        apiKey: currentUserData?.apiKey,
        apiSecret: currentUserData?.apiSecret,
        baseUrl: FFAppState().baseURL,
        employeeId: currentUserData?.id,
        isMissing: 1,
      );

      if (GetEmployeeAttendanceCall.message(
                (_model.missingAttendanceResponse?.jsonBody ?? ''),
              ) !=
              null &&
          (GetEmployeeAttendanceCall.message(
            (_model.missingAttendanceResponse?.jsonBody ?? ''),
          ))!
              .isNotEmpty) {
        _model.showData = true;
        safeSetState(() {});
      } else {
        _model.showData = false;
        safeSetState(() {});
        FFAppState().errors = functions.jsonToErrors(
            (_model.missingAttendanceResponse?.jsonBody ?? ''),
            (_model.missingAttendanceResponse?.statusCode ?? 200).toString());
        safeSetState(() {});
        if (currentUserData?.debugMode == 1) {
          context.pushNamed(
            'debug',
            extra: <String, dynamic>{
              kTransitionInfoKey: const TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        } else {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: SizedBox(
                    height: 175.0,
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    child: SuccessfulMessageWidget(
                      apiMessege: FFAppState().errors.error,
                    ),
                  ),
                ),
              );
            },
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).info,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
              backgroundColor: const Color(0xFF002855),
              automaticallyImplyLeading: false,
              title: Text(
                FFLocalizations.of(context).getText(
                  '2co6ijow' /* Missing Attendance */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Open Sans',
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts:
                          GoogleFonts.asMap().containsKey('Open Sans'),
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: Stack(
                children: [
                  RefreshIndicator(
                    backgroundColor: FlutterFlowTheme.of(context).info,
                    onRefresh: () async {
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed(
                        'MissingAttendancePage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.showData == true)
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Builder(
                                builder: (context) {
                                  final missingAttendance = (getJsonField(
                                        (_model.missingAttendanceResponse
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.message''',
                                        true,
                                      )
                                                  ?.toList()
                                                  .map<EmployeeCheckStruct?>(
                                                      EmployeeCheckStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<EmployeeCheckStruct?>)
                                          .withoutNulls
                                          .toList() ??
                                      [];

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:
                                        List.generate(missingAttendance.length,
                                                (missingAttendanceIndex) {
                                      final missingAttendanceItem =
                                          missingAttendance[
                                              missingAttendanceIndex];
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.96,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: const Color(0x27000000),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 7.0, 5.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'hb0kunpw' /* Date :  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                                      missingAttendanceItem
                                                                          .toMap(),
                                                                      r'''$.check_in_date''',
                                                                    ) ==
                                                                    null
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    getJsonField(
                                                                      missingAttendanceItem
                                                                          .toMap(),
                                                                      r'''$.check_out_date''',
                                                                    )?.toString(),
                                                                    'No data',
                                                                  )
                                                                : valueOrDefault<
                                                                    String>(
                                                                    getJsonField(
                                                                      missingAttendanceItem
                                                                          .toMap(),
                                                                      r'''$.check_in_date''',
                                                                    )?.toString(),
                                                                    'No data',
                                                                  ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Container(
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xFFECF1F8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              const Color(0x27000000),
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      7.0,
                                                                      0.0,
                                                                      7.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                                      missingAttendanceItem
                                                                          .toMap(),
                                                                      r'''$.check_in_day''',
                                                                    ) !=
                                                                    null
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    getJsonField(
                                                                      missingAttendanceItem
                                                                          .toMap(),
                                                                      r'''$.check_in_day''',
                                                                    )?.toString(),
                                                                    'No data',
                                                                  )
                                                                : valueOrDefault<
                                                                    String>(
                                                                    getJsonField(
                                                                      missingAttendanceItem
                                                                          .toMap(),
                                                                      r'''$.check_out_day''',
                                                                    )?.toString(),
                                                                    'No data',
                                                                  ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '02mku1v9' /* Check in */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          2.0),
                                                              child: Icon(
                                                                Icons.done,
                                                                color: Color(
                                                                    0xFF70E000),
                                                                size: 28.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.formatFieldCheckInAndOut(
                                                                      getJsonField(
                                                                        missingAttendanceItem
                                                                            .toMap(),
                                                                        r'''$.check_in_time''',
                                                                      ),
                                                                      FFAppState().language),
                                                                  'No Date Missing',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'loj9ikib' /* Check Out */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          2.0),
                                                              child: Icon(
                                                                Icons.close,
                                                                color: Color(
                                                                    0xFFDC2F02),
                                                                size: 28.0,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.formatFieldCheckInAndOut(
                                                                      getJsonField(
                                                                        missingAttendanceItem
                                                                            .toMap(),
                                                                        r'''$.check_out_time''',
                                                                      ),
                                                                      FFAppState().language),
                                                                  'No Date Missing',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 5.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                6.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'NewtransactionPage',
                                                          queryParameters: {
                                                            'isAttendance':
                                                                serializeParam(
                                                              true,
                                                              ParamType.bool,
                                                            ),
                                                            'date':
                                                                serializeParam(
                                                              getJsonField(
                                                                        missingAttendanceItem
                                                                            .toMap(),
                                                                        r'''$.check_in_date''',
                                                                      ) !=
                                                                      null
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      getJsonField(
                                                                        missingAttendanceItem
                                                                            .toMap(),
                                                                        r'''$.check_in_date''',
                                                                      )?.toString(),
                                                                      'No data',
                                                                    )
                                                                  : valueOrDefault<
                                                                      String>(
                                                                      getJsonField(
                                                                        missingAttendanceItem
                                                                            .toMap(),
                                                                        r'''$.check_out_date''',
                                                                      )?.toString(),
                                                                      'No data',
                                                                    ),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 85.0,
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFECF1F8),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '09w00r27' /* Request */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    })
                                            .divide(const SizedBox(height: 15.0))
                                            .addToEnd(const SizedBox(height: 25.0)),
                                  );
                                },
                              ),
                            ),
                        ]
                            .addToStart(const SizedBox(height: 12.0))
                            .addToEnd(const SizedBox(height: 70.0)),
                      ),
                    ),
                  ),
                  if (_model.showData == false)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).info,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/jsons/login.json',
                            width: 250.0,
                            height: 250.0,
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 25.0, 5.0, 0.0),
                            child: Text(
                              getJsonField(
                                        (_model.missingAttendanceResponse
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.message''',
                                      ) !=
                                      null
                                  ? FFLocalizations.of(context).getVariableText(
                                      enText:
                                          'Missing Attendance  data is not available',
                                      arText:
                                          'بيانات الحضور المفقود  غير متوفرة',
                                    )
                                  : FFLocalizations.of(context).getVariableText(
                                      enText:
                                          'Missing Attendance  data is not available',
                                      arText:
                                          'بيانات الحضور المفقود  غير متوفرة',
                                    ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const NavBarWidget(
                        pageName: 'MissingAttendancePage',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
