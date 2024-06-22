import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_quiz_widget.dart' show AddQuizWidget;
import 'package:flutter/material.dart';

class AddQuizModel extends FlutterFlowModel<AddQuizWidget> {
  ///  Local state fields for this page.

  bool optionA = false;

  bool optionB = false;

  bool optionC = false;

  bool optionD = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for images widget.
  FocusNode? imagesFocusNode;
  TextEditingController? imagesTextController;
  String? Function(BuildContext, String?)? imagesTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for review widget.
  FocusNode? reviewFocusNode;
  TextEditingController? reviewTextController;
  String? Function(BuildContext, String?)? reviewTextControllerValidator;
  // State field(s) for review-image widget.
  FocusNode? reviewImageFocusNode;
  TextEditingController? reviewImageTextController;
  String? Function(BuildContext, String?)? reviewImageTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuizRecord? quizCreateResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    imagesFocusNode?.dispose();
    imagesTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    textFieldFocusNode5?.dispose();
    textController6?.dispose();

    reviewFocusNode?.dispose();
    reviewTextController?.dispose();

    reviewImageFocusNode?.dispose();
    reviewImageTextController?.dispose();
  }
}
