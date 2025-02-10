import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/forms_comp/attandance_req/attandance_req_widget.dart';
import '/pages/componets/my_requests/attendance_card/attendance_card_widget.dart';
import '/pages/componets/my_requests/card_complaints/card_complaints_widget.dart';
import '/pages/componets/my_requests/card_finclaims_card/card_finclaims_card_widget.dart';
import '/pages/componets/my_requests/card_leaves/card_leaves_widget.dart';
import '/pages/componets/my_requests/card_loans/card_loans_widget.dart';
import '/pages/componets/my_requests/card_misc/card_misc_widget.dart';
import '/pages/componets/my_requests/card_overtime/card_overtime_widget.dart';
import '/pages/componets/my_requests/card_training/card_training_widget.dart';
import '/pages/componets/my_requests/card_vacations/card_vacations_widget.dart';
import '/pages/componets/my_requests/shift_card/shift_card_widget.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import '/pages/componets/response_messages/successful_message/successful_message_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'newtransaction_page_model.dart';
export 'newtransaction_page_model.dart';

class NewtransactionPageWidget extends StatefulWidget {
  const NewtransactionPageWidget({
    super.key,
    bool? isAttendance,
    this.date,
  }) : isAttendance = isAttendance ?? false;

  final bool isAttendance;
  final String? date;

  @override
  State<NewtransactionPageWidget> createState() =>
      _NewtransactionPageWidgetState();
}

class _NewtransactionPageWidgetState extends State<NewtransactionPageWidget> {
  late NewtransactionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewtransactionPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkinternetConnection(
        context,
      );
      _model.transaction = await TransactionStatsCall.call(
        apiKey: currentUserData?.apiKey,
        apiSecret: currentUserData?.apiSecret,
        baseUrl: FFAppState().baseURL,
        userId: currentUserData?.id,
      );

      if (!(_model.transaction?.succeeded ?? true)) {
        FFAppState().errors = functions.jsonToErrors(
            (_model.transaction?.jsonBody ?? ''),
            (_model.transaction?.statusCode ?? 200).toString());
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
                child: SizedBox(
                  height: 175.0,
                  width: MediaQuery.sizeOf(context).width * 0.85,
                  child: SuccessfulMessageWidget(
                    apiMessege: FFAppState().errors.error,
                  ),
                ),
              );
            },
          );
        }
      }
      if (widget.isAttendance) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: const Color(0xFFCED4DA),
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.72,
                child: AttandanceReqWidget(
                  dateFromMissingAttand: widget.date,
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
      _model.changeStatus = false;
      safeSetState(() {});
      FFAppState().drawer = 0;
      safeSetState(() {});
      await actions.checkInactivityAndLogout(
        context,
      );
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
      builder: (context) => Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).info,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: const Color(0xFF002855),
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'isugqyy3' /* New Transaction */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily:
                        FlutterFlowTheme.of(context).headlineMediumFamily,
                    color: Colors.white,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).headlineMediumFamily),
                  ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 1.0),
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: RefreshIndicator(
                  backgroundColor: FlutterFlowTheme.of(context).info,
                  onRefresh: () async {
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed(
                      'NewtransactionPage',
                      queryParameters: {
                        'isAttendance': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                        'date': serializeParam(
                          widget.date,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      25.0,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 8.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.14,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.73,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.085,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(12.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                ),
                                                border: Border.all(
                                                  color: const Color(0x27000000),
                                                ),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ay5j5xs5' /* New Request */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.2,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.2,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  currentUserData!.image,
                                                  fit: BoxFit.cover,
                                                  alignment:
                                                      const Alignment(0.0, -1.0),
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.jpg',
                                                    fit: BoxFit.cover,
                                                    alignment:
                                                        const Alignment(0.0, -1.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              indent: 12.0,
                              endIndent: 12.0,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x27000000),
                                    width: 1.2,
                                  ),
                                ),
                                child: wrapWithModel(
                                  model: _model.cardVacationsModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardVacationsWidget(
                                    annualBalance: valueOrDefault<String>(
                                      formatNumber(
                                        TransactionStatsCall.annualRequests(
                                          (_model.transaction?.jsonBody ?? ''),
                                        ),
                                        formatType: FormatType.custom,
                                        format: '0',
                                        locale: '',
                                      ),
                                      '0',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x27000000),
                                    width: 1.2,
                                  ),
                                ),
                                child: wrapWithModel(
                                  model: _model.cardLeavesModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardLeavesWidget(
                                    totalLeave: valueOrDefault<String>(
                                      formatNumber(
                                        TransactionStatsCall.leavesRequests(
                                          (_model.transaction?.jsonBody ?? ''),
                                        ),
                                        formatType: FormatType.custom,
                                        format: '0',
                                        locale: '',
                                      ),
                                      '0',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x27000000),
                                    width: 1.2,
                                  ),
                                ),
                                child: wrapWithModel(
                                  model: _model.cardFinclaimsCardModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardFinclaimsCardWidget(
                                    clamis: valueOrDefault<String>(
                                      formatNumber(
                                        TransactionStatsCall.totalClaims(
                                          (_model.transaction?.jsonBody ?? ''),
                                        ),
                                        formatType: FormatType.custom,
                                        format: '0',
                                        locale: '',
                                      ),
                                      '0',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x27000000),
                                    width: 1.2,
                                  ),
                                ),
                                child: wrapWithModel(
                                  model: _model.cardOvertimeModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardOvertimeWidget(
                                    overTimeRequest: valueOrDefault<int>(
                                      TransactionStatsCall.overTimeRequest(
                                        (_model.transaction?.jsonBody ?? ''),
                                      ),
                                      0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x27000000),
                                    width: 1.2,
                                  ),
                                ),
                                child: wrapWithModel(
                                  model: _model.cardLoansModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardLoansWidget(
                                    loans: valueOrDefault<String>(
                                      formatNumber(
                                        TransactionStatsCall.totalLoans(
                                          (_model.transaction?.jsonBody ?? ''),
                                        ),
                                        formatType: FormatType.custom,
                                        format: '0',
                                        locale: '',
                                      ),
                                      '0',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x27000000),
                                    width: 1.2,
                                  ),
                                ),
                                child: wrapWithModel(
                                  model: _model.cardTrainingModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardTrainingWidget(
                                    totalREQ: valueOrDefault<String>(
                                      formatNumber(
                                        TransactionStatsCall
                                            .totalTrainingRequests(
                                          (_model.transaction?.jsonBody ?? ''),
                                        ),
                                        formatType: FormatType.custom,
                                        format: '0',
                                        locale: '',
                                      ),
                                      '0',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x27000000),
                                    width: 1.2,
                                  ),
                                ),
                                child: wrapWithModel(
                                  model: _model.attendanceCardModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AttendanceCardWidget(
                                    totalAttendanceREQ: valueOrDefault<String>(
                                      formatNumber(
                                        TransactionStatsCall.totalAttendance(
                                          (_model.transaction?.jsonBody ?? ''),
                                        ),
                                        formatType: FormatType.custom,
                                        format: '0',
                                        locale: '',
                                      ),
                                      '0',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x27000000),
                                    width: 1.2,
                                  ),
                                ),
                                child: wrapWithModel(
                                  model: _model.shiftCardModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ShiftCardWidget(
                                    totalShiftREQ: valueOrDefault<String>(
                                      formatNumber(
                                        TransactionStatsCall.shiftREQ(
                                          (_model.transaction?.jsonBody ?? ''),
                                        ),
                                        formatType: FormatType.custom,
                                        format: '0',
                                        locale: '',
                                      ),
                                      '0',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x27000000),
                                    width: 1.2,
                                  ),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 1.0),
                                  child: wrapWithModel(
                                    model: _model.cardMiscModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CardMiscWidget(
                                      totalRequest: valueOrDefault<int>(
                                        TransactionStatsCall
                                            .miscellaneousRequests(
                                          (_model.transaction?.jsonBody ?? ''),
                                        ),
                                        0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 10.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0x27000000),
                                    width: 1.2,
                                  ),
                                ),
                                child: wrapWithModel(
                                  model: _model.cardComplaintsModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardComplaintsWidget(
                                    grievancesBalance: valueOrDefault<String>(
                                      formatNumber(
                                        TransactionStatsCall.grievanceRequests(
                                          (_model.transaction?.jsonBody ?? ''),
                                        ),
                                        formatType: FormatType.custom,
                                        format: '0',
                                        locale: '',
                                      ),
                                      '0',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(height: 5.0))
                              .addToStart(const SizedBox(height: 5.0))
                              .addToEnd(const SizedBox(height: 55.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => safeSetState(() {}),
                child: const NavBarWidget(
                  pageName: 'NewtransactionPage',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
