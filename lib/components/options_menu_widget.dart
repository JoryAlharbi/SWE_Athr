import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'options_menu_model.dart';
export 'options_menu_model.dart';

class OptionsMenuWidget extends StatefulWidget {
  const OptionsMenuWidget({
    super.key,
    required this.reservationRef,
  });

  final DocumentReference? reservationRef;

  @override
  State<OptionsMenuWidget> createState() => _OptionsMenuWidgetState();
}

class _OptionsMenuWidgetState extends State<OptionsMenuWidget> {
  late OptionsMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionsMenuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.reservationRef!.delete();
      },
      child: Container(
        width: double.infinity,
        height: 65.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Delete',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    color: const Color(0xFFFF0000),
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
