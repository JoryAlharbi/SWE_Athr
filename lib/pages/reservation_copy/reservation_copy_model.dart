import '/flutter_flow/flutter_flow_util.dart';
import 'reservation_copy_widget.dart' show ReservationCopyWidget;
import 'package:flutter/material.dart';

class ReservationCopyModel extends FlutterFlowModel<ReservationCopyWidget> {
  ///  Local state fields for this page.

  DocumentReference? workshopRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
