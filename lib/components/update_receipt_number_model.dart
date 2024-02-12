import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'update_receipt_number_widget.dart' show UpdateReceiptNumberWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateReceiptNumberModel
    extends FlutterFlowModel<UpdateReceiptNumberWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for receiptNumber widget.
  FocusNode? receiptNumberFocusNode;
  TextEditingController? receiptNumberController;
  String? Function(BuildContext, String?)? receiptNumberControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    receiptNumberFocusNode?.dispose();
    receiptNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
