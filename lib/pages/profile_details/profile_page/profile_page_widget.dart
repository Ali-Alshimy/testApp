import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import '/pages/componets/profile/profile_card_attachments/profile_card_attachments_widget.dart';
import '/pages/componets/profile/profile_card_bankinformation/profile_card_bankinformation_widget.dart';
import '/pages/componets/profile/profile_card_contactinfromation/profile_card_contactinfromation_widget.dart';
import '/pages/componets/profile/salary/deductions_salary/deductions_salary_widget.dart';
import '/pages/componets/profile/salary/earnings/earnings_widget.dart';
import '/pages/componets/profile/salary/profile_financial_salary/profile_financial_salary_widget.dart';
import '/pages/componets/profile/salary/total_salary/total_salary_widget.dart';
import '/pages/componets/response_messages/hent_to_salary/hent_to_salary_widget.dart';
import '/pages/componets/response_messages/successful_message/successful_message_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget>
    with TickerProviderStateMixin {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: const Color(0xFF002855),
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'eucwfgfi' /* Profile */,
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
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                                unselectedLabelStyle: const TextStyle(),
                                indicatorColor: const Color(0xFF002855),
                                padding: const EdgeInsets.all(4.0),
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'bnqj1hhh' /* Personal */,
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => Tab(
                                      text: FFLocalizations.of(context).getText(
                                        'ybm13ogj' /* Salary */,
                                      ),
                                      iconMargin:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              4.0, 0.0, 7.0, 0.0),
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [
                                    () async {},
                                    () async {
                                      if (FFAppState().DontShowagain != true) {
                                        if (_model.tabBarCurrentIndex != 0) {
                                          await showDialog(
                                            barrierColor: const Color(0x34000000),
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: const AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: SizedBox(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.22,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    child: const HentToSalaryWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      }
                                    }
                                  ][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 20.0, 15.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.97,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: GridView(
                                                padding: const EdgeInsets.fromLTRB(
                                                  0,
                                                  20.0,
                                                  0,
                                                  0,
                                                ),
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 20.0,
                                                  mainAxisSpacing: 50.0,
                                                  childAspectRatio: 1.6,
                                                ),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  wrapWithModel(
                                                    model: _model
                                                        .profileCardContactinfromationModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        const ProfileCardContactinfromationWidget(),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .profileCardBankinformationModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        const ProfileCardBankinformationWidget(),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .profileCardAttachmentsModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        const ProfileCardAttachmentsWidget(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Builder(
                                      builder: (context) =>
                                          FutureBuilder<ApiCallResponse>(
                                        future: SalaryMonthAndYearCall.call(
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
                                          final stackSalaryMonthAndYearResponse =
                                              snapshot.data!;

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().errors =
                                                  functions.jsonToErrors(
                                                      stackSalaryMonthAndYearResponse
                                                          .jsonBody,
                                                      stackSalaryMonthAndYearResponse
                                                          .statusCode
                                                          .toString());
                                              safeSetState(() {});
                                              if (currentUserData?.debugMode ==
                                                  1) {
                                                context.pushNamed(
                                                  'debug',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: SizedBox(
                                                          height: 175.0,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.85,
                                                          child:
                                                              SuccessfulMessageWidget(
                                                            apiMessege:
                                                                FFAppState()
                                                                    .errors
                                                                    .error,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                            child: Stack(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              children: [
                                                if (SalaryMonthAndYearCall
                                                                .message(
                                                              stackSalaryMonthAndYearResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            null &&
                                                        (SalaryMonthAndYearCall
                                                                .message(
                                                          stackSalaryMonthAndYearResponse
                                                              .jsonBody,
                                                        ))!
                                                            .isNotEmpty
                                                    ? (SalaryMonthAndYearCall
                                                            .message(
                                                          stackSalaryMonthAndYearResponse
                                                              .jsonBody,
                                                        )?.length !=
                                                        0)
                                                    : false)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: RefreshIndicator(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      onRefresh: () async {
                                                        context.pushNamed(
                                                            'ProfilePage');

                                                        safeSetState(() {
                                                          _model
                                                              .tabBarController!
                                                              .animateTo(
                                                            _model.tabBarController!
                                                                    .length -
                                                                1,
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );
                                                        });
                                                      },
                                                      child:
                                                          SingleChildScrollView(
                                                        physics:
                                                            const AlwaysScrollableScrollPhysics(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          7.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .dropDownYearValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.dropDownYearValue ??= functions
                                                                          .extractYears(
                                                                              stackSalaryMonthAndYearResponse.jsonBody)
                                                                          .firstOrNull,
                                                                    ),
                                                                    options: functions
                                                                        .extractYears(
                                                                            stackSalaryMonthAndYearResponse.jsonBody),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.dropDownYearValue =
                                                                                val),
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.46,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.065,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '09tkkj8p' /* Select  Year */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        true,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                        .dropDownMonthValueController ??= FormFieldController<
                                                                            String>(
                                                                        null),
                                                                    options: functions.getMonthsForYear(
                                                                        stackSalaryMonthAndYearResponse
                                                                            .jsonBody,
                                                                        _model
                                                                            .dropDownYearValue!),
                                                                    onChanged:
                                                                        (val) async {
                                                                      safeSetState(() =>
                                                                          _model.dropDownMonthValue =
                                                                              val);
                                                                      _model.month =
                                                                          _model
                                                                              .dropDownMonthValue;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.46,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.065,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'sx0f1mr3' /* Select  Month */,
                                                                    ),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    disabled: _model.dropDownYearValue ==
                                                                            null ||
                                                                        _model.dropDownYearValue ==
                                                                            '',
                                                                    isOverButton:
                                                                        true,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            if (_model.month !=
                                                                    null &&
                                                                _model.month !=
                                                                    '')
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future:
                                                                        SalaryDetailsCall
                                                                            .call(
                                                                      apiKey: currentUserData
                                                                          ?.apiKey,
                                                                      apiSecret:
                                                                          currentUserData
                                                                              ?.apiSecret,
                                                                      userId:
                                                                          currentUserData
                                                                              ?.id,
                                                                      yaer: _model
                                                                          .dropDownYearValue,
                                                                      month: _model
                                                                          .month,
                                                                      baseUrl:
                                                                          FFAppState()
                                                                              .baseURL,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return const Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                85.0,
                                                                            height:
                                                                                85.0,
                                                                            child:
                                                                                SpinKitRipple(
                                                                              color: Color(0xFF002855),
                                                                              size: 85.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnSalaryDetailsResponse =
                                                                          snapshot
                                                                              .data!;

                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          FFAppState().errors = functions.jsonToErrors(
                                                                              columnSalaryDetailsResponse.jsonBody,
                                                                              columnSalaryDetailsResponse.statusCode.toString());
                                                                          safeSetState(
                                                                              () {});
                                                                          if (currentUserData?.debugMode ==
                                                                              1) {
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
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
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
                                                                        },
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            wrapWithModel(
                                                                              model: _model.profileFinancialSalaryModel,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: ProfileFinancialSalaryWidget(
                                                                                currency: valueOrDefault<String>(
                                                                                  SalaryDetailsCall.currency(
                                                                                    columnSalaryDetailsResponse.jsonBody,
                                                                                  ),
                                                                                  'No data',
                                                                                ),
                                                                                frequency: valueOrDefault<String>(
                                                                                  SalaryDetailsCall.payrollFrequency(
                                                                                    columnSalaryDetailsResponse.jsonBody,
                                                                                  ),
                                                                                  'No data',
                                                                                ),
                                                                                workingDays: valueOrDefault<String>(
                                                                                  SalaryDetailsCall.workingDays(
                                                                                    columnSalaryDetailsResponse.jsonBody,
                                                                                  )?.toString(),
                                                                                  'No data',
                                                                                ),
                                                                                date: valueOrDefault<String>(
                                                                                  SalaryDetailsCall.postingDate(
                                                                                    columnSalaryDetailsResponse.jsonBody,
                                                                                  ),
                                                                                  'No data',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (SalaryDetailsCall.earnings(
                                                                                      columnSalaryDetailsResponse.jsonBody,
                                                                                    ) !=
                                                                                    null &&
                                                                                (SalaryDetailsCall.earnings(
                                                                                  columnSalaryDetailsResponse.jsonBody,
                                                                                ))!
                                                                                    .isNotEmpty)
                                                                              wrapWithModel(
                                                                                model: _model.earningsModel,
                                                                                updateCallback: () => safeSetState(() {}),
                                                                                child: EarningsWidget(
                                                                                  earnings: getJsonField(
                                                                                    columnSalaryDetailsResponse.jsonBody,
                                                                                    r'''$.message.earnings''',
                                                                                    true,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (SalaryDetailsCall.deductions(
                                                                                      columnSalaryDetailsResponse.jsonBody,
                                                                                    ) !=
                                                                                    null &&
                                                                                (SalaryDetailsCall.deductions(
                                                                                  columnSalaryDetailsResponse.jsonBody,
                                                                                ))!
                                                                                    .isNotEmpty)
                                                                              wrapWithModel(
                                                                                model: _model.deductionsSalaryModel,
                                                                                updateCallback: () => safeSetState(() {}),
                                                                                child: DeductionsSalaryWidget(
                                                                                  deductions: getJsonField(
                                                                                    columnSalaryDetailsResponse.jsonBody,
                                                                                    r'''$.message.deductions''',
                                                                                    true,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            wrapWithModel(
                                                                              model: _model.totalSalaryModel,
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: TotalSalaryWidget(
                                                                                grossPay: valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    SalaryDetailsCall.grosspay(
                                                                                      columnSalaryDetailsResponse.jsonBody,
                                                                                    ),
                                                                                    formatType: FormatType.custom,
                                                                                    format: ',###.#',
                                                                                    locale: '',
                                                                                  ),
                                                                                  'No data',
                                                                                ),
                                                                                totalDeduction: valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    SalaryDetailsCall.totalDeduction(
                                                                                      columnSalaryDetailsResponse.jsonBody,
                                                                                    ),
                                                                                    formatType: FormatType.custom,
                                                                                    format: ',###.#',
                                                                                    locale: '',
                                                                                  ),
                                                                                  'No data',
                                                                                ),
                                                                                netPay: valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    SalaryDetailsCall.netPay(
                                                                                      columnSalaryDetailsResponse.jsonBody,
                                                                                    ),
                                                                                    formatType: FormatType.custom,
                                                                                    format: ',###.#',
                                                                                    locale: '',
                                                                                  ),
                                                                                  'No data',
                                                                                ),
                                                                                loanRepayment: valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    SalaryDetailsCall.loanRepayment(
                                                                                      columnSalaryDetailsResponse.jsonBody,
                                                                                    ),
                                                                                    formatType: FormatType.custom,
                                                                                    format: ',###.#',
                                                                                    locale: '',
                                                                                  ),
                                                                                  'No data',
                                                                                ),
                                                                                grossYearToDateSAR: valueOrDefault<String>(
                                                                                  formatNumber(
                                                                                    SalaryDetailsCall.yearToDate(
                                                                                      columnSalaryDetailsResponse.jsonBody,
                                                                                    ),
                                                                                    formatType: FormatType.custom,
                                                                                    format: ',###.#',
                                                                                    locale: '',
                                                                                  ),
                                                                                  'No data',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(const SizedBox(height: 15.0)).addToStart(const SizedBox(height: 4.0)).addToEnd(const SizedBox(height: 75.0)),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                          ].addToEnd(const SizedBox(
                                                              height: 75.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (SalaryMonthAndYearCall
                                                                .message(
                                                              stackSalaryMonthAndYearResponse
                                                                  .jsonBody,
                                                            ) !=
                                                            null &&
                                                        (SalaryMonthAndYearCall
                                                                .message(
                                                          stackSalaryMonthAndYearResponse
                                                              .jsonBody,
                                                        ))!
                                                            .isNotEmpty
                                                    ? (SalaryMonthAndYearCall
                                                            .message(
                                                          stackSalaryMonthAndYearResponse
                                                              .jsonBody,
                                                        )?.length ==
                                                        0)
                                                    : true)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 95.0,
                                                                0.0, 0.0),
                                                    child: RefreshIndicator(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      onRefresh: () async {
                                                        context.pushNamed(
                                                          'ProfilePage',
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child:
                                                          SingleChildScrollView(
                                                        physics:
                                                            const AlwaysScrollableScrollPhysics(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Lottie.asset(
                                                                    'assets/jsons/login.json',
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.8,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.24,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                    animate:
                                                                        true,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            25.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                                stackSalaryMonthAndYearResponse.jsonBody,
                                                                                r'''$.message''',
                                                                              ) ==
                                                                              null
                                                                          ? FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                              enText: 'There is no Salary',
                                                                              arText: 'لا يوجد راتب',
                                                                            )
                                                                          : FFLocalizations.of(context)
                                                                              .getVariableText(
                                                                              enText: 'There is no Salary',
                                                                              arText: 'لا يوجد راتب',
                                                                            ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBarWidget(
                    pageName: 'ProfilePage',
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
