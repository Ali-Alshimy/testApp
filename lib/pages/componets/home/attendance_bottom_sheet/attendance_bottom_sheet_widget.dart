import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/componets/response_messages/errors_print/errors_print_widget.dart';
import '/pages/componets/response_messages/successful_message/successful_message_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'attendance_bottom_sheet_model.dart';
export 'attendance_bottom_sheet_model.dart';

class AttendanceBottomSheetWidget extends StatefulWidget {
  const AttendanceBottomSheetWidget({super.key});

  @override
  State<AttendanceBottomSheetWidget> createState() =>
      _AttendanceBottomSheetWidgetState();
}

class _AttendanceBottomSheetWidgetState
    extends State<AttendanceBottomSheetWidget> with TickerProviderStateMixin {
  late AttendanceBottomSheetModel _model;

  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttendanceBottomSheetModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1240.0.ms,
            hz: 3,
            offset: const Offset(5.0, 0.0),
            rotation: 0.017,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1240.0.ms,
            hz: 3,
            offset: const Offset(5.0, 0.0),
            rotation: 0.017,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: const Center(
          child: SizedBox(
            width: 85.0,
            height: 85.0,
            child: SpinKitRipple(
              color: Color(0xFF002855),
              size: 85.0,
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).info,
          boxShadow: const [
            BoxShadow(
              blurRadius: 1.2,
              color: Color(0x27000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(17.0),
            topRight: Radius.circular(17.0),
          ),
          border: Border.all(
            color: const Color(0x27000000),
            width: 1.0,
          ),
        ),
        alignment: const AlignmentDirectional(0.0, -1.0),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  functions.verifyAttendanceTime() == false
                                      ? FFLocalizations.of(context)
                                          .getVariableText(
                                          enText: 'Good Evening',
                                          arText: 'مساء الخير',
                                        )
                                      : FFLocalizations.of(context)
                                          .getVariableText(
                                          enText: 'Good Morning',
                                          arText: 'صباح الخير',
                                        ),
                                  'Good Morning',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    9.0, 4.0, 5.0, 4.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'wrjkmqtp' /* Track check-in and check-out f... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (functions.verifyAttendanceTime() == true)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: const Icon(
                          Icons.sunny,
                          color: Color(0xFFFFD100),
                          size: 50.0,
                        ).animateOnPageLoad(
                            animationsMap['iconOnPageLoadAnimation1']!),
                      ),
                    if (functions.verifyAttendanceTime() == false)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: const Icon(
                          Icons.mode_night_sharp,
                          color: Color(0xE6788E9E),
                          size: 50.0,
                        ).animateOnPageLoad(
                            animationsMap['iconOnPageLoadAnimation2']!),
                      ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 8.0, 5.0, 3.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 1.5,
                            color: Color(0x21000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        border: Border.all(
                          color: const Color(0x27000000),
                          width: 1.5,
                        ),
                      ),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Builder(builder: (context) {
                          final googleMapMarker = currentUserLocationValue;
                          return FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) => safeSetState(
                                () => _model.googleMapsCenter = latLng),
                            initialLocation: _model.googleMapsCenter ??=
                                currentUserLocationValue!,
                            markers: [
                              if (googleMapMarker != null)
                                FlutterFlowMarker(
                                  googleMapMarker.serialize(),
                                  googleMapMarker,
                                ),
                            ],
                            markerColor: GoogleMarkerColor.red,
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 14.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: true,
                            showMapToolbar: false,
                            showTraffic: true,
                            centerMapOnMarkerTap: true,
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-0.04, 0.82),
                          child: Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: const LatLng(0.0, 0.0));
                                  FFAppState().check = false;
                                  safeSetState(() {});
                                  _model.checkIn =
                                      await EmployeeCheckInAndOutCall.call(
                                    apiKey: currentUserData?.apiKey,
                                    apiSecret: currentUserData?.apiSecret,
                                    baseUrl: FFAppState().baseURL,
                                    userId: currentUserData?.id,
                                    logType: FFAppState().check == true
                                        ? 'OUT'
                                        : 'IN',
                                    time: functions.getNowDateTime(),
                                    location:
                                        currentUserLocationValue?.toString(),
                                  );

                                  if ((_model.checkIn?.succeeded ?? true)) {
                                    await showDialog(
                                      barrierColor: const Color(0x27000000),
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: SizedBox(
                                            height: 175.0,
                                            width: 95.0,
                                            child: SuccessfulMessageWidget(
                                              apiMessege: getJsonField(
                                                (_model.checkIn?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    FFAppState().errors =
                                        functions.jsonToErrors(
                                            (_model.checkIn?.jsonBody ?? ''),
                                            (_model.checkIn?.statusCode ?? 200)
                                                .toString());
                                    safeSetState(() {});
                                    if (currentUserData?.debugMode == 1) {
                                      context.pushNamed(
                                        'debug',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
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
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: SizedBox(
                                              height: 175.0,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.85,
                                              child: ErrorsPrintWidget(
                                                apiResponse:
                                                    FFAppState().errors.error,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  }

                                  _model.checkInAndOUt =
                                      await GetEmployeeCheckinCall.call(
                                    apiKey: currentUserData?.apiKey,
                                    apiSecret: currentUserData?.apiSecret,
                                    userId: currentUserData?.id,
                                    baseUrl: FFAppState().baseURL,
                                  );

                                  if ((_model.checkInAndOUt?.succeeded ??
                                      true)) {
                                    FFAppState().checkin =
                                        GetEmployeeCheckinCall.checkin(
                                      (_model.checkInAndOUt?.jsonBody ?? ''),
                                    )!;
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'fpecby4t' /* Check in */,
                                ),
                                icon: const Icon(
                                  Icons.check_circle_outlined,
                                  size: 25.0,
                                ),
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.57,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFF38B000),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                functions.formatDateTimeAttendance(
                                    FFAppState().checkin,
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Date',
                                      arText: 'التاريخ',
                                    ),
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'hour',
                                      arText: 'الساعة',
                                    ),
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Check in',
                                      arText: 'دخول',
                                    ),
                                    FFAppState().language),
                                'Date: 21-9     Time : 8 pm',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-0.04, 0.82),
                          child: Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 15.0, 8.0, 8.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: const LatLng(0.0, 0.0));
                                  FFAppState().check = true;
                                  safeSetState(() {});
                                  _model.checkOut =
                                      await EmployeeCheckInAndOutCall.call(
                                    apiKey: currentUserData?.apiKey,
                                    apiSecret: currentUserData?.apiSecret,
                                    baseUrl: FFAppState().baseURL,
                                    userId: currentUserData?.id,
                                    logType: FFAppState().check == true
                                        ? 'OUT'
                                        : 'IN',
                                    time: functions.getNowDateTime(),
                                    location:
                                        currentUserLocationValue?.toString(),
                                  );

                                  if ((_model.checkOut?.succeeded ?? true)) {
                                    await showDialog(
                                      barrierColor: const Color(0x27000000),
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: SizedBox(
                                            height: 175.0,
                                            width: 95.0,
                                            child: SuccessfulMessageWidget(
                                              apiMessege: getJsonField(
                                                (_model.checkOut?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    FFAppState().errors =
                                        functions.jsonToErrors(
                                            (_model.checkOut?.jsonBody ?? ''),
                                            (_model.checkOut?.statusCode ?? 200)
                                                .toString());
                                    safeSetState(() {});
                                    if (currentUserData?.debugMode == 1) {
                                      context.pushNamed(
                                        'debug',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
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
                                            alignment: const AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: SizedBox(
                                              height: 175.0,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.85,
                                              child: ErrorsPrintWidget(
                                                apiResponse:
                                                    FFAppState().errors.error,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  }

                                  _model.checkInAndOUt2 =
                                      await GetEmployeeCheckinCall.call(
                                    apiKey: currentUserData?.apiKey,
                                    apiSecret: currentUserData?.apiSecret,
                                    userId: currentUserData?.id,
                                    baseUrl: FFAppState().baseURL,
                                  );

                                  if ((_model.checkInAndOUt2?.succeeded ??
                                      true)) {
                                    FFAppState().checkout =
                                        GetEmployeeCheckinCall.checkout(
                                      (_model.checkInAndOUt2?.jsonBody ?? ''),
                                    )!;
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  '5xbwpnxa' /* Check out  */,
                                ),
                                icon: const Icon(
                                  Icons.cancel_sharp,
                                  size: 25.0,
                                ),
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.57,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.05,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFFC12929),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 10.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                functions.formatDateTimeAttendance(
                                    FFAppState().checkout,
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Date',
                                      arText: 'التاريخ',
                                    ),
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'hour',
                                      arText: 'الساعة',
                                    ),
                                    FFLocalizations.of(context).getVariableText(
                                      enText: 'Check out',
                                      arText: 'خروج',
                                    ),
                                    FFAppState().language),
                                'Date: 21-9     Time : 4 am',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
