import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'empty_filter2_model.dart';
export 'empty_filter2_model.dart';

class EmptyFilter2Widget extends StatefulWidget {
  const EmptyFilter2Widget({super.key});

  @override
  State<EmptyFilter2Widget> createState() => _EmptyFilter2WidgetState();
}

class _EmptyFilter2WidgetState extends State<EmptyFilter2Widget> {
  late EmptyFilter2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyFilter2Model());

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
      height: 400.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 350.0,
            height: 350.0,
            decoration: BoxDecoration(),
            child: Lottie.asset(
              'assets/lottie_animations/98121-empty-state.json',
              width: 350.0,
              height: 350.0,
              fit: BoxFit.scaleDown,
              animate: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Text(
              'Selected category is empty. \nPlease choose another cateory.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
