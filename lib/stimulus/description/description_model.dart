import '/flutter_flow/flutter_flow_util.dart';
import 'description_widget.dart' show DescriptionWidget;
import 'package:flutter/material.dart';

class DescriptionModel extends FlutterFlowModel<DescriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [AdMob - Show Interstitial Ad] action in IconButton widget.
  bool? interstitialAdSuccess;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
