import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componets/my_requests/shift_request_card/shift_request_card_widget.dart';
import '/pages/componets/my_requests/small_attandancerequest_card/small_attandancerequest_card_widget.dart';
import '/pages/componets/my_requests/small_card_annual/small_card_annual_widget.dart';
import '/pages/componets/my_requests/small_card_complaints/small_card_complaints_widget.dart';
import '/pages/componets/my_requests/small_card_fincliam/small_card_fincliam_widget.dart';
import '/pages/componets/my_requests/small_card_leave/small_card_leave_widget.dart';
import '/pages/componets/my_requests/small_card_loans/small_card_loans_widget.dart';
import '/pages/componets/my_requests/small_cardmisc/small_cardmisc_widget.dart';
import '/pages/componets/my_requests/small_cardovertime/small_cardovertime_widget.dart';
import '/pages/componets/my_requests/training_card/training_card_widget.dart';
import '/pages/componets/nav_bar/nav_bar/nav_bar_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_transactions_page_model.dart';
export 'my_transactions_page_model.dart';

class MyTransactionsPageWidget extends StatefulWidget {
  const MyTransactionsPageWidget({super.key});

  @override
  State<MyTransactionsPageWidget> createState() =>
      _MyTransactionsPageWidgetState();
}

class _MyTransactionsPageWidgetState extends State<MyTransactionsPageWidget> {
  late MyTransactionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyTransactionsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkinternetConnection(
        context,
      );
      FFAppState().drawer = 0;
      safeSetState(() {});
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
                '4mqzezgy' /* My Transaction  */,
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
              RefreshIndicator(
                backgroundColor: FlutterFlowTheme.of(context).info,
                onRefresh: () async {
                  context.pushNamed(
                    'MyTransactionsPage',
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
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.69,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.085,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12.0),
                                            bottomRight: Radius.circular(12.0),
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(12.0),
                                          ),
                                          border: Border.all(
                                            color: const Color(0x27000000),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dbiey4lf' /* My Requests */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 3.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.2,
                                        height:
                                            MediaQuery.sizeOf(context).width *
                                                0.2,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          currentUserData!.image,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Image.asset(
                                            'assets/images/error_image.jpg',
                                            fit: BoxFit.cover,
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
                      Divider(
                        thickness: 1.0,
                        indent: 12.0,
                        endIndent: 12.0,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.95,
                        height: MediaQuery.sizeOf(context).height * 0.65,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 15.0, 5.0, 0.0),
                                child: GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 7.0,
                                    mainAxisSpacing: 7.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    wrapWithModel(
                                      model: _model.smallCardAnnualModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const SmallCardAnnualWidget(),
                                    ),
                                    wrapWithModel(
                                      model: _model.smallCardFincliamModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const SmallCardFincliamWidget(),
                                    ),
                                    wrapWithModel(
                                      model: _model.smallCardLeaveModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const SmallCardLeaveWidget(),
                                    ),
                                    wrapWithModel(
                                      model: _model.smallCardLoansModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const SmallCardLoansWidget(),
                                    ),
                                    wrapWithModel(
                                      model: _model.smallCardovertimeModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const SmallCardovertimeWidget(),
                                    ),
                                    wrapWithModel(
                                      model: _model
                                          .smallAttandancerequestCardModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const SmallAttandancerequestCardWidget(),
                                    ),
                                    wrapWithModel(
                                      model: _model.shiftRequestCardModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const ShiftRequestCardWidget(),
                                    ),
                                    wrapWithModel(
                                      model: _model.trainingCardModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const TrainingCardWidget(),
                                    ),
                                    wrapWithModel(
                                      model: _model.smallCardmiscModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const SmallCardmiscWidget(),
                                    ),
                                    wrapWithModel(
                                      model: _model.smallCardComplaintsModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const SmallCardComplaintsWidget(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].addToStart(const SizedBox(height: 8.0)),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavBarWidget(
                    pageName: 'MyTransactionsPage',
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
