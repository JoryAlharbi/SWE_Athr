import '/flutter_flow/flutter_flow_util.dart';
import 'homepage_copy_widget.dart' show HomepageCopyWidget;
import 'package:flutter/material.dart';

class HomepageCopyModel extends FlutterFlowModel<HomepageCopyWidget> {
  ///  Local state fields for this page.

  DocumentReference? workshopRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
