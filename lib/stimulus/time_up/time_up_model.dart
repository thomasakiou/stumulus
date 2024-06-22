import '/flutter_flow/flutter_flow_util.dart';
import 'time_up_widget.dart' show TimeUpWidget;
import 'package:flutter/material.dart';

class TimeUpModel extends FlutterFlowModel<TimeUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Button widget.
  bool? interstitialAdSuccess;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
