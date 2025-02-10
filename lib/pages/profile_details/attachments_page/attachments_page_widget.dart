import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import '/pages/componets/profile/attachment_list/attachment_list_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'attachments_page_model.dart';
export 'attachments_page_model.dart';

class AttachmentsPageWidget extends StatefulWidget {
  const AttachmentsPageWidget({super.key});

  @override
  State<AttachmentsPageWidget> createState() => _AttachmentsPageWidgetState();
}

class _AttachmentsPageWidgetState extends State<AttachmentsPageWidget> {
  late AttachmentsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttachmentsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkinternetConnection(
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
                'suih7n61' /* Attachmentes  */,
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
          child: FutureBuilder<ApiCallResponse>(
            future: EmployeeAttachmentCall.call(
              userId: currentUserData?.id,
              baseUrl: FFAppState().baseURL,
              apiSecret: currentUserData?.apiSecret,
              apiKey: currentUserData?.apiKey,
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
              final stackEmployeeAttachmentResponse = snapshot.data!;

              return Stack(
                children: [
                  if (getJsonField(
                        stackEmployeeAttachmentResponse.jsonBody,
                        r'''$.message.appointments[:].document''',
                      ) !=
                      null)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 30.0),
                      child: RefreshIndicator(
                        backgroundColor: FlutterFlowTheme.of(context).info,
                        onRefresh: () async {
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed(
                            'AttachmentsPage',
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
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 2.0, 20.0),
                                  child: wrapWithModel(
                                    model: _model.attachmentListModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: AttachmentListWidget(
                                      message: getJsonField(
                                        stackEmployeeAttachmentResponse
                                            .jsonBody,
                                        r'''$.message.appointments''',
                                        true,
                                      )!,
                                      num: EmployeeAttachmentCall.num(
                                        stackEmployeeAttachmentResponse
                                            .jsonBody,
                                      )!,
                                      missing: EmployeeAttachmentCall.missing(
                                        stackEmployeeAttachmentResponse
                                            .jsonBody,
                                      )!,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if ((getJsonField(
                            stackEmployeeAttachmentResponse.jsonBody,
                            r'''$.message.appointments[:].document''',
                          ) ==
                          null) ||
                      (getJsonField(
                            stackEmployeeAttachmentResponse.jsonBody,
                            r'''$.message''',
                          ) ==
                          null))
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
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
                                () {
                                  if (getJsonField(
                                        stackEmployeeAttachmentResponse
                                            .jsonBody,
                                        r'''$.message''',
                                      ) ==
                                      null) {
                                    return getJsonField(
                                      stackEmployeeAttachmentResponse.jsonBody,
                                      r'''$.exception''',
                                    ).toString();
                                  } else if (EmployeeAttachmentCall.num(
                                        stackEmployeeAttachmentResponse
                                            .jsonBody,
                                      ) ==
                                      0) {
                                    return FFLocalizations.of(context)
                                        .getVariableText(
                                      enText: 'No attachments required',
                                      arText: 'لا يوجد مرفقات مطلوبة ',
                                    );
                                  } else {
                                    return getJsonField(
                                      stackEmployeeAttachmentResponse.jsonBody,
                                      r'''$.exception''',
                                    ).toString();
                                  }
                                }(),
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
                    ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const NavBarWidget(
                        pageName: 'AttachmentsPage',
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
