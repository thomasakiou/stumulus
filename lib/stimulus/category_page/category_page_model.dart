import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'category_page_widget.dart' show CategoryPageWidget;
import 'package:flutter/material.dart';

class CategoryPageModel extends FlutterFlowModel<CategoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<QuizSetRecord> simpleSearchResults = [];
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Row widget.
  bool? interstitialAdSuccess;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Row widget.
  bool? interstitialAdSuccess2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
