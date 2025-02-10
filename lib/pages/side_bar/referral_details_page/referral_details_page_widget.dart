import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import '/pages/componets/referral/referral_data_list/referral_data_list_widget.dart';
import '/pages/componets/response_messages/successful_message/successful_message_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'referral_details_page_model.dart';
export 'referral_details_page_model.dart';

class ReferralDetailsPageWidget extends StatefulWidget {
  const ReferralDetailsPageWidget({super.key});

  @override
  State<ReferralDetailsPageWidget> createState() =>
      _ReferralDetailsPageWidgetState();
}

class _ReferralDetailsPageWidgetState extends State<ReferralDetailsPageWidget> {
  late ReferralDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReferralDetailsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkinternetConnection(
        context,
      );
      _model.referral = await ReferralsJobTitlesListCall.call(
        apiKey: currentUserData?.apiKey,
        apiSecret: currentUserData?.apiSecret,
        baseUrl: FFAppState().baseURL,
      );

      if ((_model.referral?.succeeded ?? true)) {
        _model.show = true;
        safeSetState(() {});
      } else {
        _model.show = false;
        safeSetState(() {});
        FFAppState().errors = functions.jsonToErrors(
            (_model.referral?.jsonBody ?? ''),
            (_model.referral?.statusCode ?? 200).toString());
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

        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        context.pushNamed(
          'ReferralDetailsPage',
          extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }

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
                  'kcogoz7g' /* Referral Details  */,
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
                if (_model.show == true)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final referralList = getJsonField(
                          (_model.referral?.jsonBody ?? ''),
                          r'''$.message''',
                        ).toList();

                        return RefreshIndicator(
                          backgroundColor: FlutterFlowTheme.of(context).info,
                          onRefresh: () async {
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              'ReferralDetailsPage',
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
                              children: List.generate(referralList.length,
                                      (referralListIndex) {
                                final referralListItem =
                                    referralList[referralListIndex];
                                return Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.96,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        border: Border.all(
                                          color: const Color(0x27000000),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: ReferralDataListWidget(
                                        key: Key(
                                            'Keyj6x_${referralListIndex}_of_${referralList.length}'),
                                        jobTitle: getJsonField(
                                          referralListItem,
                                          r'''$.job_title''',
                                        ),
                                        id: getJsonField(
                                          referralListItem,
                                          r'''$.id''',
                                        ),
                                        description: getJsonField(
                                          referralListItem,
                                          r'''$.description''',
                                        ),
                                        upperSalary: getJsonField(
                                          referralListItem,
                                          r'''$.upper_range_salary''',
                                        ),
                                        lowerSalary: getJsonField(
                                          referralListItem,
                                          r'''$.lower_range_salary''',
                                        ),
                                        status: getJsonField(
                                          referralListItem,
                                          r'''$.status''',
                                        ),
                                        department: getJsonField(
                                          referralListItem,
                                          r'''$.department''',
                                        ),
                                        currency: getJsonField(
                                          referralListItem,
                                          r'''$.currency''',
                                        ),
                                        numOfPositions: getJsonField(
                                          referralListItem,
                                          r'''$.num_of_positions''',
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })
                                  .divide(const SizedBox(height: 15.0))
                                  .addToStart(const SizedBox(height: 13.0))
                                  .addToEnd(const SizedBox(height: 75.0)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (_model.show == false)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Lottie.asset(
                            'assets/jsons/login.json',
                            width: 250.0,
                            height: 250.0,
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 25.0, 5.0, 0.0),
                          child: Text(
                            getJsonField(
                                      (_model.referral?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ) ==
                                    null
                                ? FFLocalizations.of(context).getVariableText(
                                    enText: 'There are no available jobs.',
                                    arText: 'لا توجد وظائف متاحة.',
                                  )
                                : getJsonField(
                                    (_model.referral?.jsonBody ?? ''),
                                    r'''$.exception''',
                                  ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
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
                      pageName: 'ReferralDetailsPage',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
