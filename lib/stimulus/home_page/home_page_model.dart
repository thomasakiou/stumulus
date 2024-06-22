import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Row widget.
  bool? interstitialAdSuccess;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Row widget.
  bool? interstitialAdSuccess2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
