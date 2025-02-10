import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/componets/privacy/company_privacy_policy/company_privacy_policy_widget.dart';
import '/pages/componets/response_messages/errors_print/errors_print_widget.dart';
import '/pages/componets/response_messages/login_error/login_error_widget.dart';
import '/pages/componets/response_messages/url_error/url_error_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget>
    with TickerProviderStateMixin {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.getFCM();
      if ((FFAppState().loadEmail != '') &&
          (FFAppState().deviceID != '') &&
          (FFAppState().password != '')) {
        safeSetState(() {
          _model.tabBarController!.animateTo(
            min(_model.tabBarController!.length - 1,
                _model.tabBarController!.index + 1),
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        });

        final localAuth = LocalAuthentication();
        bool isBiometricSupported = await localAuth.isDeviceSupported();

        if (isBiometricSupported) {
          try {
            _model.biometricLogin = await localAuth.authenticate(
                localizedReason: FFLocalizations.of(context).getVariableText(
              enText: 'Fingerprint Login – Secure and Easy',
              arText: 'تسجيل الدخول ببصمة الإصبع – بسهولة وأمان',
            ));
          } on PlatformException {
            _model.biometricLogin = false;
          }
          safeSetState(() {});
        }

        if (_model.biometricLogin) {
          _model.apiResultkp0 = await LoginApiCall.call(
            usrName: FFAppState().loadEmail,
            password: FFAppState().password,
            baseUrl: FFAppState().baseURL,
            deviceId: FFAppState().deviceID,
            fcmToken: FFAppState().fcmToken,
          );

          if ((_model.apiResultkp0?.succeeded ?? true)) {
            authManager.updateAuthUserData(
              userData: UserDataStruct(
                apiKey: LoginApiCall.apiKey(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                apiSecret: LoginApiCall.apiSecret(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                id: LoginApiCall.id(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                jopTitle: LoginApiCall.jopTitle(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                servicePeriod: LoginApiCall.servicePeriod(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                fullName: LoginApiCall.userName(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                image: '${FFAppState().baseURL}${LoginApiCall.image(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                )}',
                department: LoginApiCall.department(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                servicePeriodYears: LoginApiCall.year(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                email: LoginApiCall.email(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                debugMode: LoginApiCall.debugMode(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                manger: LoginApiCall.manger(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                faceDetection: LoginApiCall.faceDetection(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                company: LoginApiCall.company(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                checkout: LoginApiCall.checkout(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
                checkin: LoginApiCall.checkin(
                  (_model.apiResultkp0?.jsonBody ?? ''),
                ),
              ),
            );

            context.goNamed(
              'HomePage',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else {
            FFAppState().errors = functions.jsonToErrors(
                (_model.apiResultkp0?.jsonBody ?? ''),
                (_model.apiResultkp0?.statusCode ?? 200).toString());
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
                barrierColor: const Color(0x27100000),
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
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        width: MediaQuery.sizeOf(context).width * 0.94,
                        child: ErrorsPrintWidget(
                          apiResponse: FFAppState().errors.error,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        } else {
          return;
        }
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.baseURLTextController ??= TextEditingController(
        text: FFAppState().baseURL != ''
            ? FFAppState().baseURL
            : '');
    _model.baseURLFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController(
        text: FFAppState().loadEmail != ''
            ? FFAppState().loadEmail
            : '');
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'qchxsfy0' /* Talentio */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineLargeFamily,
                          color: const Color(0xFF002855),
                          fontSize: 55.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).headlineLargeFamily),
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    constraints: const BoxConstraints(
                      maxWidth: 530.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Opacity(
                                        opacity: 0.85,
                                        child: Lottie.asset(
                                          'assets/jsons/Animation_-_1721564316839.json',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.24,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          18.0, 10.0, 18.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                            ))
                                              Container(
                                                width: 230.0,
                                                height: 16.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'cxh6s5f3' /* Get Started. */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily),
                                                      ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 4.0, 0.0, 24.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ce3w1awn' /* Let's get started by filling o... */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 5.0, 0.0, 12.0),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .baseURLTextController,
                                                  focusNode:
                                                      _model.baseURLFocusNode,
                                                  autofocus: true,
                                                  autofillHints: const [
                                                    AutofillHints.url
                                                  ],
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'dknkidaq' /* URL */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'mae4un7d' /*  https://example.com */,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x27000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFF0267C1),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    contentPadding:
                                                        const EdgeInsets.all(24.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                                  keyboardType:
                                                      TextInputType.url,
                                                  validator: _model
                                                      .baseURLTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Builder(
                                                builder: (context) => Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 18.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (_model.baseURLTextController
                                                                  .text !=
                                                              '') {
                                                        FFAppState().baseURL =
                                                            _model
                                                                .baseURLTextController
                                                                .text;
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model
                                                              .tabBarController!
                                                              .animateTo(
                                                            min(
                                                                _model.tabBarController!
                                                                        .length -
                                                                    1,
                                                                _model.tabBarController!
                                                                        .index +
                                                                    1),
                                                            duration: const Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );
                                                        });
                                                      } else {
                                                        await showDialog(
                                                          barrierColor:
                                                              const Color(0x27000000),
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: const AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    SizedBox(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.25,
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.9,
                                                                  child:
                                                                      const UrlErrorWidget(),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'aqdxqjze' /* Get Started */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 230.0,
                                                      height: 52.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFF002855),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Montserrat'),
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation1']!),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.83,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Container(
                                                    width: 230.0,
                                                    height: 16.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'yqjjs36r' /* Welcome Back */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily),
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 14.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ike7bmv9' /* Fill out the information below... */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                                Form(
                                                  key: _model.formKey,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      SizedBox(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .emailAddressTextController,
                                                          focusNode: _model
                                                              .emailAddressFocusNode,
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            _model.validateEmail =
                                                                true;
                                                            if (_model.formKey
                                                                        .currentState ==
                                                                    null ||
                                                                !_model.formKey
                                                                    .currentState!
                                                                    .validate()) {
                                                              safeSetState(() =>
                                                                  _model.validateEmail =
                                                                      false);
                                                              return;
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          autofocus: true,
                                                          autofillHints: const [
                                                            AutofillHints.email
                                                          ],
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: false,
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'c8st9zhv' /* Email */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'br1xjqks' /* example@example.com */,
                                                            ),
                                                            errorStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFF004BA8),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        24.0,
                                                                        15.0,
                                                                        24.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                          textAlign:
                                                              TextAlign.justify,
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          cursorColor:
                                                              const Color(0xFF002855),
                                                          validator: _model
                                                              .emailAddressTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: SizedBox(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .passwordTextController,
                                                            focusNode: _model
                                                                .passwordFocusNode,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              _model.validatePassword =
                                                                  true;
                                                              if (_model.formKey
                                                                          .currentState ==
                                                                      null ||
                                                                  !_model
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                safeSetState(() =>
                                                                    _model.validatePassword =
                                                                        false);
                                                                return;
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            autofocus: true,
                                                            autofillHints: const [
                                                              AutofillHints
                                                                  .password
                                                            ],
                                                            obscureText: !_model
                                                                .passwordVisibility,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'tq6ghuhe' /* Password */,
                                                              ),
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelLargeFamily,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '6maour8p' /* •••••••• */,
                                                              ),
                                                              errorStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0xFF004BA8),
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          24.0,
                                                                          15.0,
                                                                          24.0),
                                                              suffixIcon:
                                                                  InkWell(
                                                                onTap: () =>
                                                                    safeSetState(
                                                                  () => _model
                                                                          .passwordVisibility =
                                                                      !_model
                                                                          .passwordVisibility,
                                                                ),
                                                                focusNode: FocusNode(
                                                                    skipTraversal:
                                                                        true),
                                                                child: Icon(
                                                                  _model.passwordVisibility
                                                                      ? Icons
                                                                          .visibility_outlined
                                                                      : Icons
                                                                          .visibility_off_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyLargeFamily),
                                                                ),
                                                            textAlign: TextAlign
                                                                .justify,
                                                            keyboardType:
                                                                TextInputType
                                                                    .visiblePassword,
                                                            cursorColor: const Color(
                                                                0xFF002855),
                                                            validator: _model
                                                                .passwordTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 14.0)),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        var shouldSetState =
                                                            false;
                                                        if (FFAppState()
                                                                    .deviceID ==
                                                                '') {
                                                          _model.devicId =
                                                              await actions
                                                                  .uuid();
                                                          shouldSetState =
                                                              true;
                                                          FFAppState()
                                                                  .deviceID =
                                                              _model.devicId!;
                                                          safeSetState(() {});
                                                        }
                                                        _model.validateEmailAndPassword =
                                                            true;
                                                        if (_model.formKey
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey
                                                                .currentState!
                                                                .validate()) {
                                                          safeSetState(() =>
                                                              _model.validateEmailAndPassword =
                                                                  false);
                                                          return;
                                                        }
                                                        shouldSetState = true;
                                                        if (_model
                                                                .validateEmailAndPassword ==
                                                            true) {
                                                          _model.login =
                                                              await LoginApiCall
                                                                  .call(
                                                            usrName: _model
                                                                .emailAddressTextController
                                                                .text,
                                                            password: _model
                                                                .passwordTextController
                                                                .text,
                                                            baseUrl:
                                                                FFAppState()
                                                                    .baseURL,
                                                            deviceId:
                                                                FFAppState()
                                                                    .deviceID,
                                                            fcmToken:
                                                                FFAppState()
                                                                    .fcmToken,
                                                          );

                                                          shouldSetState =
                                                              true;
                                                          if ((_model.login
                                                                  ?.succeeded ??
                                                              true)) {
                                                            if (functions
                                                                .isBodyValid((_model
                                                                        .login
                                                                        ?.jsonBody ??
                                                                    ''))) {
                                                              GoRouter.of(
                                                                      context)
                                                                  .prepareAuthEvent();
                                                              await authManager
                                                                  .signIn(
                                                                userData:
                                                                    UserDataStruct(
                                                                  apiKey:
                                                                      LoginApiCall
                                                                          .apiKey(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  apiSecret:
                                                                      LoginApiCall
                                                                          .apiSecret(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  id: LoginApiCall
                                                                      .id(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  jopTitle:
                                                                      LoginApiCall
                                                                          .jopTitle(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  servicePeriod:
                                                                      LoginApiCall
                                                                          .servicePeriod(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  fullName:
                                                                      LoginApiCall
                                                                          .userName(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  image:
                                                                      '${FFAppState().baseURL}${LoginApiCall.image(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )}',
                                                                  department:
                                                                      LoginApiCall
                                                                          .department(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  servicePeriodYears:
                                                                      LoginApiCall
                                                                          .year(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  email:
                                                                      LoginApiCall
                                                                          .email(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  debugMode:
                                                                      LoginApiCall
                                                                          .debugMode(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  faceDetection:
                                                                      LoginApiCall
                                                                          .faceDetection(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  manger:
                                                                      LoginApiCall
                                                                          .manger(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  company:
                                                                      LoginApiCall
                                                                          .company(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  checkout:
                                                                      LoginApiCall
                                                                          .checkout(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  checkin:
                                                                      LoginApiCall
                                                                          .checkin(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                ),
                                                              );
                                                              FFAppState()
                                                                      .UserData =
                                                                  UserDataStruct(
                                                                apiKey:
                                                                    LoginApiCall
                                                                        .apiKey(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                apiSecret:
                                                                    LoginApiCall
                                                                        .apiSecret(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                id: LoginApiCall
                                                                    .id(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                jopTitle:
                                                                    LoginApiCall
                                                                        .jopTitle(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                servicePeriod:
                                                                    LoginApiCall
                                                                        .servicePeriod(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                fullName:
                                                                    LoginApiCall
                                                                        .userName(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                image:
                                                                    '${FFAppState().baseURL}${LoginApiCall.image(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )}',
                                                                department:
                                                                    LoginApiCall
                                                                        .department(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                servicePeriodYears:
                                                                    LoginApiCall
                                                                        .year(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                email:
                                                                    LoginApiCall
                                                                        .email(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                debugMode:
                                                                    LoginApiCall
                                                                        .debugMode(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                faceDetection:
                                                                    LoginApiCall
                                                                        .faceDetection(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                manger:
                                                                    LoginApiCall
                                                                        .manger(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                company:
                                                                    LoginApiCall
                                                                        .company(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                checkout:
                                                                    LoginApiCall
                                                                        .checkout(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                checkin:
                                                                    LoginApiCall
                                                                        .checkin(
                                                                  (_model.login
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                      .loadEmail =
                                                                  LoginApiCall
                                                                      .email(
                                                                (_model.login
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!;
                                                              FFAppState()
                                                                      .password =
                                                                  _model
                                                                      .passwordTextController
                                                                      .text;
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                      .checkin =
                                                                  currentUserData!
                                                                      .checkin;
                                                              FFAppState()
                                                                      .checkout =
                                                                  currentUserData!
                                                                      .checkout;
                                                              safeSetState(
                                                                  () {});
                                                              if (FFAppState()
                                                                  .CompanyPolicy) {
                                                                FFAppState()
                                                                    .drawer = 0;
                                                                safeSetState(
                                                                    () {});

                                                                context
                                                                    .goNamedAuth(
                                                                  'HomePage',
                                                                  context
                                                                      .mounted,
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
                                                              } else {
                                                                await showDialog(
                                                                  barrierColor:
                                                                      const Color(
                                                                          0x27000000),
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.77,
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.92,
                                                                          child:
                                                                              const CompanyPrivacyPolicyWidget(),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            } else {
                                                              await showDialog(
                                                                barrierColor: const Color(
                                                                    0x27000000),
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.3,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.9,
                                                                        child:
                                                                            const LoginErrorWidget(),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          } else {
                                                            FFAppState()
                                                                    .errors =
                                                                functions.jsonToErrors(
                                                                    (_model.login
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    (_model.login?.statusCode ??
                                                                            200)
                                                                        .toString());
                                                            safeSetState(() {});
                                                            if (currentUserData
                                                                    ?.debugMode ==
                                                                1) {
                                                              context
                                                                  .pushNamedAuth(
                                                                'debug',
                                                                context.mounted,
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
                                                            } else {
                                                              await showDialog(
                                                                barrierColor: const Color(
                                                                    0x27100000),
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.3,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.94,
                                                                        child:
                                                                            ErrorsPrintWidget(
                                                                          apiResponse: FFAppState()
                                                                              .errors
                                                                              .error,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          }
                                                        } else {
                                                          if (shouldSetState) {
                                                            safeSetState(() {});
                                                          }
                                                          return;
                                                        }

                                                        if (shouldSetState) {
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3bqqztgg' /* Sign In */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.6,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.06,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            const Color(0xFF002855),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: const Color(
                                                                      0xFFF2F2F4),
                                                                  fontSize:
                                                                      17.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'zfr1k45r' /* Forgot Password? */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.04,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  32.0,
                                                                  0.0,
                                                                  32.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: const Color(
                                                                    0xFF090909),
                                                                fontSize: 13.0,
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
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 12.0)),
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation2']!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: FlutterFlowButtonTabBar(
                            useToggleButtonStyle: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                            unselectedLabelStyle: const TextStyle(),
                            labelColor: const Color(0xFFF2F2F4),
                            unselectedLabelColor: const Color(0xFF09090B),
                            backgroundColor: const Color(0xFF002855),
                            unselectedBackgroundColor:
                                FlutterFlowTheme.of(context).alternate,
                            borderColor: const Color(0xFF09090B),
                            unselectedBorderColor:
                                FlutterFlowTheme.of(context).alternate,
                            borderWidth: 1.3,
                            borderRadius: 12.0,
                            elevation: 0.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            tabs: [
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'omiqp66w' /* Setting Page */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'zvdg0hr5' /* Log In */,
                                ),
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}][i]();
                            },
                          ),
                        ),
                      ],
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
