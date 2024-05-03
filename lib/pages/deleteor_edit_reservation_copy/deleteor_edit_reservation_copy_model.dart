import '/flutter_flow/flutter_flow_util.dart';
import 'deleteor_edit_reservation_copy_widget.dart'
    show DeleteorEditReservationCopyWidget;
import 'package:flutter/material.dart';

class DeleteorEditReservationCopyModel
    extends FlutterFlowModel<DeleteorEditReservationCopyWidget> {
  ///  Local state fields for this page.

  DateTime? startDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
