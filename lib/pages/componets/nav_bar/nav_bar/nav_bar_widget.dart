import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    required this.pageName,
  });

  final String? pageName;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultghb = await NumberOfUnreadNotificationsCall.call(
        apiKey: currentUserData?.apiKey,
        apiSecret: currentUserData?.apiSecret,
        baseUrl: FFAppState().baseURL,
        mobileApp: 'Talentio',
      );

      FFAppState().numNotifications = NumberOfUnreadNotificationsCall.count(
        (_model.apiResultghb?.jsonBody ?? ''),
      );
      safeSetState(() {});
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

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 0.09,
        decoration: const BoxDecoration(),
        child: Stack(
          alignment: const AlignmentDirectional(0.0, 1.0),
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 0.075,
              decoration: BoxDecoration(
                color: const Color(0x27000000),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Colors.transparent,
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              child: Stack(
                alignment: const AlignmentDirectional(0.0, 0.0),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/Rectangle_3.png',
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.55,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).info,
                              borderRadius: 20.0,
                              buttonSize: 45.0,
                              fillColor: widget.pageName == 'HomePageCopy'
                                  ? const Color(0xFFCED4DA)
                                  : FlutterFlowTheme.of(context).info,
                              icon: const Icon(
                                Icons.home,
                                color: Color(0xFF002855),
                                size: 26.0,
                              ),
                              onPressed: () async {
                                if (FFAppState().drawer == 0) {
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
                                }
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 35.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: FlutterFlowTheme.of(context).info,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                fillColor:
                                    widget.pageName == 'MyTransactionsPage'
                                        ? const Color(0xFFCED4DA)
                                        : FlutterFlowTheme.of(context).info,
                                icon: const Icon(
                                  Icons.playlist_add_check_circle,
                                  color: Color(0xFF002855),
                                  size: 26.0,
                                ),
                                onPressed: () async {
                                  if (FFAppState().drawer == 0) {
                                    context.pushNamed(
                                      'MyTransactionsPage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  35.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: FlutterFlowTheme.of(context).info,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                fillColor: widget.pageName == 'AttendancePage'
                                    ? const Color(0xFFCED4DA)
                                    : FlutterFlowTheme.of(context).info,
                                icon: const Icon(
                                  Icons.access_time_filled,
                                  color: Color(0xFF002855),
                                  size: 26.0,
                                ),
                                onPressed: () async {
                                  if (FFAppState().drawer == 0) {
                                    context.pushNamed(
                                      'AttendancePage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().numNotifications =
                                  NumberOfUnreadNotificationsCall.count(
                                (_model.apiResultghb?.jsonBody ?? ''),
                              );
                              safeSetState(() {});
                            },
                            child: Stack(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).info,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 45.0,
                                      fillColor: widget.pageName ==
                                              'NotificationPage'
                                          ? const Color(0xFFCED4DA)
                                          : FlutterFlowTheme.of(context).info,
                                      icon: const Icon(
                                        Icons.notifications_active,
                                        color: Color(0xFF002855),
                                        size: 26.0,
                                      ),
                                      onPressed: () async {
                                        if (FFAppState().drawer == 0) {
                                          context.pushNamed(
                                            'NotificationPage',
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
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                if (FFAppState().numNotifications != 0)
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 5.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.025,
                                        height:
                                            MediaQuery.sizeOf(context).width *
                                                0.025,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          shape: BoxShape.circle,
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 20.0),
                child: FlutterFlowIconButton(
                  borderColor: const Color(0x00FFFFFF),
                  borderRadius: 25.0,
                  buttonSize: MediaQuery.sizeOf(context).width * 0.13,
                  fillColor: widget.pageName == 'NewtransactionPage'
                      ? const Color(0xFFCED4DA)
                      : const Color(0xFF002855),
                  hoverColor: const Color(0x27000000),
                  icon: Icon(
                    Icons.add,
                    color: widget.pageName == 'NewtransactionPage'
                        ? const Color(0xFF002855)
                        : FlutterFlowTheme.of(context).info,
                    size: 27.0,
                  ),
                  onPressed: () async {
                    if (FFAppState().drawer == 0) {
                      context.goNamed(
                        'NewtransactionPage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
