import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/componets/approval/hr_requests/hr_requests_widget.dart';
import '/pages/componets/approval/others_request/others_request_widget.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import '/pages/componets/response_messages/empty_list/empty_list_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'approval_page_model.dart';
export 'approval_page_model.dart';

class ApprovalPageWidget extends StatefulWidget {
  const ApprovalPageWidget({super.key});

  @override
  State<ApprovalPageWidget> createState() => _ApprovalPageWidgetState();
}

class _ApprovalPageWidgetState extends State<ApprovalPageWidget>
    with TickerProviderStateMixin {
  late ApprovalPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApprovalPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkinternetConnection(
        context,
      );
      FFAppState().drawer = 0;
      safeSetState(() {});
      await actions.checkInactivityAndLogout(
        context,
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
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
                '6m307mfy' /* Approval */,
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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).primaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                        unselectedLabelStyle: const TextStyle(),
                        indicatorColor: const Color(0xFF002855),
                        padding: const EdgeInsets.all(6.0),
                        tabs: [
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'ypjkuk2z' /* HR Requests */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'oecjzgmo' /* Other's  */,
                            ),
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          FutureBuilder<ApiCallResponse>(
                            future: HrRequestsCall.call(
                              apiKey: currentUserData?.apiKey,
                              apiSecret: currentUserData?.apiSecret,
                              baseUrl: FFAppState().baseURL,
                              userEmail: currentUserData?.email,
                              doctype: _model.choiceChipsValue1,
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
                              final stackHrRequestsResponse = snapshot.data!;

                              return Stack(
                                children: [
                                  if (getJsonField(
                                        stackHrRequestsResponse.jsonBody,
                                        r'''$.message''',
                                      ) !=
                                      null)
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 25.0),
                                        child: RefreshIndicator(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          onRefresh: () async {
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed(
                                              'ApprovalPage',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );

                                            safeSetState(() {
                                              _model.tabBarController!
                                                  .animateTo(
                                                0,
                                                duration:
                                                    const Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            });

                                            safeSetState(() {
                                              _model.choiceChipsValueController1
                                                  ?.value = [
                                                _model.choiceChipsValue1!
                                              ];
                                            });
                                            await actions
                                                .checkinternetConnection(
                                              context,
                                            );
                                          },
                                          child: SingleChildScrollView(
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(14.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '9bhsw7ak' /* Leave Application */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'nxscxqj5' /* Loan Application */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'u2rz1umw' /* Expense Claim */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '3b5i8vqj' /* Overtime Request */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '0xtmx3su' /* Training Request */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '7lq3m32c' /* Shift Request */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'ca0ezf8z' /* Attendance Request */,
                                                      ))
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .choiceChipsValue1 =
                                                            val?.firstOrNull),
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          const Color(0xFF002855),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 0.0,
                                                      labelPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  7.0,
                                                                  0.0,
                                                                  7.0,
                                                                  0.0),
                                                      elevation: 4.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          const Color(0xFFCED4DA),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      iconSize: 0.0,
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    chipSpacing: 15.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .choiceChipsValue1 !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .choiceChipsValueController1 ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ghzpagaa' /* Leave Application */,
                                                        )
                                                      ],
                                                    ),
                                                    wrapped: false,
                                                  ),
                                                ),
                                                const Divider(
                                                  thickness: 2.0,
                                                  indent: 5.0,
                                                  endIndent: 5.0,
                                                  color: Color(0x39000000),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 32.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final hrRequests =
                                                            getJsonField(
                                                          stackHrRequestsResponse
                                                              .jsonBody,
                                                          r'''$.message''',
                                                        ).toList();
                                                        if (hrRequests
                                                            .isEmpty) {
                                                          return EmptyListWidget(
                                                            isSet: hrRequests
                                                                    .isNotEmpty
                                                                ? true
                                                                : false,
                                                          );
                                                        }

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              hrRequests.length,
                                                              (hrRequestsIndex) {
                                                            final hrRequestsItem =
                                                                hrRequests[
                                                                    hrRequestsIndex];
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          7.0,
                                                                          0.0),
                                                              child:
                                                                  HrRequestsWidget(
                                                                key: Key(
                                                                    'Keyfi3_${hrRequestsIndex}_of_${hrRequests.length}'),
                                                                nextUser:
                                                                    getJsonField(
                                                                  hrRequestsItem,
                                                                  r'''$.next_user''',
                                                                ),
                                                                status:
                                                                    getJsonField(
                                                                  hrRequestsItem,
                                                                  r'''$.current_status''',
                                                                ).toString(),
                                                                nextAction:
                                                                    (getJsonField(
                                                                  hrRequestsItem,
                                                                  r'''$.next_actions''',
                                                                  true,
                                                                ) as List)
                                                                        .map<String>((s) =>
                                                                            s.toString())
                                                                        .toList(),
                                                                response:
                                                                    hrRequestsItem,
                                                                name:
                                                                    getJsonField(
                                                                  hrRequestsItem,
                                                                  r'''$.employee_name''',
                                                                ).toString(),
                                                                doctype: _model
                                                                    .choiceChipsValue1!,
                                                                employeeId:
                                                                    getJsonField(
                                                                  hrRequestsItem,
                                                                  r'''$.employee''',
                                                                ).toString(),
                                                                doctypeId:
                                                                    getJsonField(
                                                                  hrRequestsItem,
                                                                  r'''$.id''',
                                                                ).toString(),
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (getJsonField(
                                        stackHrRequestsResponse.jsonBody,
                                        r'''$.message''',
                                      ) ==
                                      null)
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 35.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Lottie.asset(
                                                'assets/jsons/login.json',
                                                width: 250.0,
                                                height: 250.0,
                                                fit: BoxFit.contain,
                                                animate: true,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 20.0, 5.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    () {
                                                      if (getJsonField(
                                                            stackHrRequestsResponse
                                                                .jsonBody,
                                                            r'''$.message''',
                                                          ) ==
                                                          null) {
                                                        return getJsonField(
                                                          stackHrRequestsResponse
                                                              .jsonBody,
                                                          r'''$.exception''',
                                                        ).toString();
                                                      } else if (getJsonField(
                                                            stackHrRequestsResponse
                                                                .jsonBody,
                                                            r'''$.message''',
                                                          ) ==
                                                          null) {
                                                        return getJsonField(
                                                          stackHrRequestsResponse
                                                              .jsonBody,
                                                          r'''$.exception''',
                                                        ).toString();
                                                      } else {
                                                        return FFLocalizations
                                                                .of(context)
                                                            .getVariableText(
                                                          enText:
                                                              'Approval Requests data is not available',
                                                          arText:
                                                              'بيانات طلبات الموافقة غير متوفرة',
                                                        );
                                                      }
                                                    }(),
                                                    'Approval Requests data is not available',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                          FutureBuilder<ApiCallResponse>(
                            future: GetDoctypesCall.call(
                              apiKey: currentUserData?.apiKey,
                              apiSecret: currentUserData?.apiSecret,
                              baseUrl: FFAppState().baseURL,
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
                              final stackGetDoctypesResponse = snapshot.data!;

                              return Stack(
                                children: [
                                  if (GetDoctypesCall.messageDoctypes(
                                            stackGetDoctypesResponse.jsonBody,
                                          ) !=
                                          null &&
                                      (GetDoctypesCall.messageDoctypes(
                                        stackGetDoctypesResponse.jsonBody,
                                      ))!
                                          .isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future:
                                            OthersApprovalsRequestsCall.call(
                                          apiKey: currentUserData?.apiKey,
                                          apiSecret: currentUserData?.apiSecret,
                                          userEmail: currentUserData?.email,
                                          baseUrl: FFAppState().baseURL,
                                          doctype: _model.choiceChipsValue2,
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
                                          final columnOthersApprovalsRequestsResponse =
                                              snapshot.data!;

                                          return RefreshIndicator(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            onRefresh: () async {
                                              safeSetState(() {
                                                _model.tabBarController!
                                                    .animateTo(
                                                  _model.tabBarController!
                                                          .length -
                                                      1,
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              });

                                              safeSetState(() {
                                                _model
                                                    .choiceChipsValueController2
                                                    ?.value = [
                                                  _model.choiceChipsValue2!
                                                ];
                                              });
                                              await actions
                                                  .checkinternetConnection(
                                                context,
                                              );
                                            },
                                            child: SingleChildScrollView(
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(14.0),
                                                    child:
                                                        FlutterFlowChoiceChips(
                                                      options: (getJsonField(
                                                        stackGetDoctypesResponse
                                                            .jsonBody,
                                                        r'''$.message.doctypes''',
                                                        true,
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()
                                                          .map((label) =>
                                                              ChipData(label))
                                                          .toList(),
                                                      onChanged: (val) =>
                                                          safeSetState(() => _model
                                                                  .choiceChipsValue2 =
                                                              val?.firstOrNull),
                                                      selectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            const Color(0xFF002855),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 0.0,
                                                        labelPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    0.0,
                                                                    7.0,
                                                                    0.0),
                                                        elevation: 4.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      unselectedChipStyle:
                                                          ChipStyle(
                                                        backgroundColor:
                                                            const Color(0xFFCED4DA),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        iconSize: 0.0,
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      chipSpacing: 15.0,
                                                      multiselect: false,
                                                      initialized: _model
                                                              .choiceChipsValue2 !=
                                                          null,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      controller: _model
                                                              .choiceChipsValueController2 ??=
                                                          FormFieldController<
                                                              List<String>>(
                                                        [
                                                          GetDoctypesCall
                                                                  .messageDoctypes(
                                                            stackGetDoctypesResponse
                                                                .jsonBody,
                                                          )!
                                                              .firstOrNull!
                                                        ],
                                                      ),
                                                      wrapped: false,
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 2.0,
                                                    indent: 5.0,
                                                    endIndent: 5.0,
                                                    color: Color(0x39000000),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      32.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final othersRequests =
                                                                  getJsonField(
                                                                columnOthersApprovalsRequestsResponse
                                                                    .jsonBody,
                                                                r'''$.message''',
                                                              ).toList();
                                                              if (othersRequests
                                                                  .isEmpty) {
                                                                return EmptyListWidget(
                                                                  isSet: othersRequests
                                                                          .isNotEmpty
                                                                      ? true
                                                                      : false,
                                                                );
                                                              }

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    othersRequests
                                                                        .length,
                                                                    (othersRequestsIndex) {
                                                                  final othersRequestsItem =
                                                                      othersRequests[
                                                                          othersRequestsIndex];
                                                                  return Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            15.0),
                                                                    child:
                                                                        OthersRequestWidget(
                                                                      key: Key(
                                                                          'Keyefe_${othersRequestsIndex}_of_${othersRequests.length}'),
                                                                      nextuser:
                                                                          getJsonField(
                                                                        othersRequestsItem,
                                                                        r'''$.next_user''',
                                                                      ).toString(),
                                                                      doctype:
                                                                          getJsonField(
                                                                        othersRequestsItem,
                                                                        r'''$.doctype''',
                                                                      ).toString(),
                                                                      status:
                                                                          getJsonField(
                                                                        othersRequestsItem,
                                                                        r'''$.current_status''',
                                                                      ).toString(),
                                                                      postingDate:
                                                                          getJsonField(
                                                                        othersRequestsItem,
                                                                        r'''$.posting_date''',
                                                                      ).toString(),
                                                                      creationDate:
                                                                          getJsonField(
                                                                        othersRequestsItem,
                                                                        r'''$.creation_date''',
                                                                      ).toString(),
                                                                      docUrl:
                                                                          getJsonField(
                                                                        othersRequestsItem,
                                                                        r'''$.doc_url''',
                                                                      ).toString(),
                                                                      id: getJsonField(
                                                                        othersRequestsItem,
                                                                        r'''$.id''',
                                                                      ).toString(),
                                                                      nextActions:
                                                                          functions
                                                                              .nullable(getJsonField(
                                                                        othersRequestsItem,
                                                                        r'''$.next_actions''',
                                                                        true,
                                                                      )!),
                                                                      parameter:
                                                                          getJsonField(
                                                                        othersRequestsItem,
                                                                        r'''$.id''',
                                                                      ).toString(),
                                                                      doctypes:
                                                                          _model
                                                                              .choiceChipsValue2!,
                                                                    ),
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  if (!(GetDoctypesCall.messageDoctypes(
                                            stackGetDoctypesResponse.jsonBody,
                                          ) !=
                                          null &&
                                      (GetDoctypesCall.messageDoctypes(
                                        stackGetDoctypesResponse.jsonBody,
                                      ))!
                                          .isNotEmpty))
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 35.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Lottie.asset(
                                                'assets/jsons/login.json',
                                                width: 250.0,
                                                height: 250.0,
                                                fit: BoxFit.contain,
                                                animate: true,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 25.0, 5.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    () {
                                                      if (getJsonField(
                                                            stackGetDoctypesResponse
                                                                .jsonBody,
                                                            r'''$.message''',
                                                          ) ==
                                                          null) {
                                                        return getJsonField(
                                                          stackGetDoctypesResponse
                                                              .jsonBody,
                                                          r'''$.exception''',
                                                        ).toString();
                                                      } else if (GetDoctypesCall
                                                                  .messageDoctypes(
                                                                stackGetDoctypesResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (GetDoctypesCall
                                                                  .messageDoctypes(
                                                            stackGetDoctypesResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty) {
                                                        return FFLocalizations
                                                                .of(context)
                                                            .getVariableText(
                                                          enText:
                                                              'Approval Requests data is not available',
                                                          arText:
                                                              'بيانات طلبات الموافقة غير متوفرة',
                                                        );
                                                      } else {
                                                        return FFLocalizations
                                                                .of(context)
                                                            .getVariableText(
                                                          enText:
                                                              'Approval Requests data is not available',
                                                          arText:
                                                              'بيانات طلبات الموافقة غير متوفرة',
                                                        );
                                                      }
                                                    }(),
                                                    'Approval Requests data is not available',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBarWidget(
                    pageName: 'ApprovalPage',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
