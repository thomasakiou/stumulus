import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_option1_model.dart';
export 'quiz_option1_model.dart';

class QuizOption1Widget extends StatefulWidget {
  const QuizOption1Widget({
    super.key,
    required this.qustionNum,
    required this.questionName,
    required this.istrue,
  });

  final String? qustionNum;
  final String? questionName;
  final bool? istrue;

  @override
  State<QuizOption1Widget> createState() => _QuizOption1WidgetState();
}

class _QuizOption1WidgetState extends State<QuizOption1Widget> {
  late QuizOption1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizOption1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 70.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        border: Border.all(
          color: () {
            if (_model.isAnswered == true) {
              return const Color(0xFF1A5C06);
            } else if (_model.isAnswered == false) {
              return const Color(0xFFFB0B0B);
            } else {
              return FlutterFlowTheme.of(context).primaryBackground;
            }
          }(),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.qustionNum,
                  'No',
                ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.questionName!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  () {
                    if (_model.isAnswered == true) {
                      return const Color(0xFF41F80B);
                    } else if (_model.isAnswered == false) {
                      return const Color(0x79FD0808);
                    } else {
                      return FlutterFlowTheme.of(context).primaryBackground;
                    }
                  }(),
                  FlutterFlowTheme.of(context).primaryBackground,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: valueOrDefault<Color>(
                    () {
                      if (_model.isAnswered == true) {
                        return const Color(0xFF41F80B);
                      } else if (_model.isAnswered == false) {
                        return const Color(0xFFFB0B0B);
                      } else {
                        return FlutterFlowTheme.of(context).primaryBackground;
                      }
                    }(),
                    FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  width: 1.0,
                ),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (FFAppState().buttonState == 1)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'QUIZ_OPTION1_Container_i9844mlw_ON_TAP');
                        if (widget.istrue!) {
                          if (_model.isAnswered != null) {
                            logFirebaseEvent(
                                'Container_update_component_state');
                            _model.disableButtons = 0;
                            _model.isAnswered = null;
                            setState(() {});
                            logFirebaseEvent('Container_update_app_state');
                            FFAppState().completedQuestions =
                                FFAppState().completedQuestions + 1;
                            setState(() {});
                            logFirebaseEvent('Container_update_app_state');
                            FFAppState().score = FFAppState().score + -1;
                            setState(() {});
                          } else {
                            logFirebaseEvent(
                                'Container_update_component_state');
                            _model.disableButtons = 0;
                            _model.isAnswered = true;
                            setState(() {});
                            logFirebaseEvent('Container_update_app_state');
                            FFAppState().completedQuestions =
                                FFAppState().completedQuestions + 1;
                            setState(() {});
                            logFirebaseEvent('Container_update_app_state');
                            FFAppState().score = FFAppState().score + 1;
                            setState(() {});
                          }
                        } else {
                          if (_model.isAnswered != null) {
                            logFirebaseEvent(
                                'Container_update_component_state');
                            _model.disableButtons = 0;
                            _model.isAnswered = null;
                            setState(() {});
                            logFirebaseEvent('Container_update_app_state');
                            FFAppState().completedQuestions =
                                FFAppState().completedQuestions + 1;
                            setState(() {});
                          } else {
                            logFirebaseEvent(
                                'Container_update_component_state');
                            _model.disableButtons = 0;
                            _model.isAnswered = false;
                            setState(() {});
                            logFirebaseEvent('Container_update_app_state');
                            FFAppState().completedQuestions =
                                FFAppState().completedQuestions + 1;
                            setState(() {});
                          }
                        }

                        logFirebaseEvent('Container_update_app_state');
                        FFAppState().buttonState = 0;
                        setState(() {});
                      },
                      child: Container(
                        width: 35.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 2.0,
                          ),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                      ),
                    ),
                  if (_model.isAnswered == true)
                    Icon(
                      Icons.check,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 30.0,
                    ),
                  if (_model.isAnswered == false)
                    const Icon(
                      Icons.close_sharp,
                      size: 30.0,
                    ),
                ],
              ),
            ),
          ].divide(const SizedBox(width: 10.0)),
        ),
      ),
    );
  }
}
