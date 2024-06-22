import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/explanation_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/stimulus/quiz_option1/quiz_option1_widget.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_page_model.dart';
export 'quiz_page_model.dart';

class QuizPageWidget extends StatefulWidget {
  const QuizPageWidget({
    super.key,
    this.quizSet,
    this.quizDuration,
  });

  final DocumentReference? quizSet;
  final int? quizDuration;

  @override
  State<QuizPageWidget> createState() => _QuizPageWidgetState();
}

class _QuizPageWidgetState extends State<QuizPageWidget>
    with TickerProviderStateMixin {
  late QuizPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      admob.loadInterstitialAd(
        "",
        "ca-app-pub-1982424754845768/7245290305",
        false,
      );

      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 1000),
        callback: (timer) async {
          if (FFAppState().clicked == 1) {
            _model.timerController.onStartTimer();
          } else {
            _model.timerController.onStopTimer();
          }
        },
        startImmediately: true,
      );
    });

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1800.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<int>(
      future: queryQuizRecordCount(
        queryBuilder: (quizRecord) => quizRecord.where(
          'quiz_set',
          isEqualTo: widget.quizSet,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        int quizPageCount = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 48.0, 20.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowTimer(
                                    initialTime: widget.quizDuration!,
                                    getDisplayTime: (value) =>
                                        StopWatchTimer.getDisplayTime(
                                      value,
                                      hours: false,
                                      milliSecond: false,
                                    ),
                                    controller: _model.timerController,
                                    updateStateInterval:
                                        const Duration(milliseconds: 1000),
                                    onChanged:
                                        (value, displayTime, shouldUpdate) {
                                      _model.timerMilliseconds = value;
                                      _model.timerValue = displayTime;
                                      if (shouldUpdate) setState(() {});
                                    },
                                    onEnded: () async {
                                      context.goNamed('TimeUp');
                                    },
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFFFF0606),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Q',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    (_model.pageNavigation + 1).toString(),
                                    '0',
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16.0,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: 50.0,
                          borderWidth: 1.0,
                          buttonSize: 48.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).text1,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            _model.interstitialAdSuccess =
                                await admob.showInterstitialAd();

                            context.pushNamed(
                              'HomePage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 500),
                                ),
                              },
                            );

                            setState(() {});
                          },
                        ).animateOnPageLoad(
                            animationsMap['iconButtonOnPageLoadAnimation']!),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: FlutterFlowAdBanner(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 70.0,
                      showsTestAd: false,
                      androidAdUnitID: 'ca-app-pub-1982424754845768/9146563328',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: const BoxDecoration(
                          color: Color(0x19FFFFFF),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            LinearPercentIndicator(
                              percent: valueOrDefault<double>(
                                FFAppState().completedQuestions / quizPageCount,
                                0.0,
                              ),
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              lineHeight: 9.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).button1,
                              barRadius: const Radius.circular(0.0),
                              padding: EdgeInsets.zero,
                            ),
                            Expanded(
                              child: StreamBuilder<List<QuizRecord>>(
                                stream: queryQuizRecord(
                                  queryBuilder: (quizRecord) => quizRecord
                                      .where(
                                        'quiz_set',
                                        isEqualTo: widget.quizSet,
                                      )
                                      .orderBy('id'),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<QuizRecord> pageViewQuizRecordList =
                                      snapshot.data!;
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 500.0,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: PageView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(
                                                    0,
                                                    min(
                                                        0,
                                                        pageViewQuizRecordList
                                                                .length -
                                                            1))),
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            pageViewQuizRecordList.length,
                                        itemBuilder: (context, pageViewIndex) {
                                          final pageViewQuizRecord =
                                              pageViewQuizRecordList[
                                                  pageViewIndex];
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (FFAppState().buttonState ==
                                                    0)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    SizedBox(
                                                                  height: 400.0,
                                                                  child:
                                                                      ExplanationWidget(
                                                                    quiz: pageViewQuizRecord
                                                                        .reference,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      text:
                                                          'Click for Explanation...',
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    10.0,
                                                                    24.0,
                                                                    10.0),
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
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      showLoadingIndicator:
                                                          false,
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'buttonOnPageLoadAnimation']!),
                                                  ),
                                                Divider(
                                                  height: 10.0,
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                if (pageViewQuizRecord.image !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
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
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                pageViewQuizRecord
                                                                    .image,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag:
                                                                  pageViewQuizRecord
                                                                      .image,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: pageViewQuizRecord
                                                            .image,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            pageViewQuizRecord
                                                                .image,
                                                            width: 250.0,
                                                            height: 150.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 24.0,
                                                          20.0, 0.0),
                                                  child: Text(
                                                    pageViewQuizRecord.question,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 26.0,
                                                          20.0, 0.0),
                                                  child: ListView(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                QuestionARecord>>(
                                                          stream:
                                                              queryQuestionARecord(
                                                            parent:
                                                                pageViewQuizRecord
                                                                    .reference,
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<QuestionARecord>
                                                                quizOption1QuestionARecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final quizOption1QuestionARecord =
                                                                quizOption1QuestionARecordList
                                                                        .isNotEmpty
                                                                    ? quizOption1QuestionARecordList
                                                                        .first
                                                                    : null;
                                                            return QuizOption1Widget(
                                                              key: Key(
                                                                  'Keymtl_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                              qustionNum: 'A',
                                                              questionName:
                                                                  quizOption1QuestionARecord!
                                                                      .question,
                                                              istrue:
                                                                  quizOption1QuestionARecord
                                                                      .isTrue,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                QuestionBRecord>>(
                                                          stream:
                                                              queryQuestionBRecord(
                                                            parent:
                                                                pageViewQuizRecord
                                                                    .reference,
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<QuestionBRecord>
                                                                quizOption1QuestionBRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final quizOption1QuestionBRecord =
                                                                quizOption1QuestionBRecordList
                                                                        .isNotEmpty
                                                                    ? quizOption1QuestionBRecordList
                                                                        .first
                                                                    : null;
                                                            return QuizOption1Widget(
                                                              key: Key(
                                                                  'Keybz1_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                              qustionNum: 'B',
                                                              questionName:
                                                                  quizOption1QuestionBRecord!
                                                                      .question,
                                                              istrue:
                                                                  quizOption1QuestionBRecord
                                                                      .isTrue,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                QuestionCRecord>>(
                                                          stream:
                                                              queryQuestionCRecord(
                                                            parent:
                                                                pageViewQuizRecord
                                                                    .reference,
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<QuestionCRecord>
                                                                quizOption1QuestionCRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final quizOption1QuestionCRecord =
                                                                quizOption1QuestionCRecordList
                                                                        .isNotEmpty
                                                                    ? quizOption1QuestionCRecordList
                                                                        .first
                                                                    : null;
                                                            return QuizOption1Widget(
                                                              key: Key(
                                                                  'Key1gb_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                              qustionNum: 'C',
                                                              questionName:
                                                                  quizOption1QuestionCRecord!
                                                                      .question,
                                                              istrue:
                                                                  quizOption1QuestionCRecord
                                                                      .isTrue,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                QuestionDRecord>>(
                                                          stream:
                                                              queryQuestionDRecord(
                                                            parent:
                                                                pageViewQuizRecord
                                                                    .reference,
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<QuestionDRecord>
                                                                quizOption1QuestionDRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final quizOption1QuestionDRecord =
                                                                quizOption1QuestionDRecordList
                                                                        .isNotEmpty
                                                                    ? quizOption1QuestionDRecordList
                                                                        .first
                                                                    : null;
                                                            return QuizOption1Widget(
                                                              key: Key(
                                                                  'Key7qm_${pageViewIndex}_of_${pageViewQuizRecordList.length}'),
                                                              qustionNum: 'D',
                                                              questionName:
                                                                  quizOption1QuestionDRecord!
                                                                      .question,
                                                              istrue:
                                                                  quizOption1QuestionDRecord
                                                                      .isTrue,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 24.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((FFAppState().completedQuestions >= 0) &&
                                      (FFAppState().completedQuestions <
                                          quizPageCount) &&
                                      (valueOrDefault<bool>(
                                              currentUserDocument?.isAdmin,
                                              false) ==
                                          true))
                                    AuthUserStreamWidget(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius: 12.0,
                                        buttonSize: 60.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .text1,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          await _model.pageViewController
                                              ?.previousPage(
                                            duration:
                                                const Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                          _model.pageNavigation =
                                              _model.pageNavigation + -1;
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  if ((FFAppState().completedQuestions >= 0) &&
                                      (FFAppState().completedQuestions <
                                          quizPageCount))
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                const Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                          FFAppState().buttonState = 1;
                                          setState(() {});
                                          if (quizPageCount !=
                                              _model.pageNavigation) {
                                            _model.pageNavigation =
                                                _model.pageNavigation + 1;
                                            setState(() {});
                                          }
                                        },
                                        text: 'Next',
                                        options: FFButtonOptions(
                                          height: 60.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().completedQuestions ==
                                      quizPageCount)
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.goNamed(
                                            'ScorePage',
                                            queryParameters: {
                                              'scoreAchieved': serializeParam(
                                                FFAppState().score,
                                                ParamType.int,
                                              ),
                                              'totalQuestions': serializeParam(
                                                quizPageCount,
                                                ParamType.int,
                                              ),
                                              'quizSet': serializeParam(
                                                widget.quizSet,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );

                                          FFAppState().buttonState = 1;
                                          setState(() {});
                                          FFAppState().completedQuestions = 0;
                                          FFAppState().update(() {});
                                        },
                                        text: 'Complete',
                                        options: FFButtonOptions(
                                          height: 60.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .text1,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                ].divide(const SizedBox(width: 10.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
