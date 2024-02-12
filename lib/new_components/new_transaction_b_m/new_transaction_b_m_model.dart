import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'new_transaction_b_m_widget.dart' show NewTransactionBMWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewTransactionBMModel extends FlutterFlowModel<NewTransactionBMWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for customerSearchField widget.
  FocusNode? customerSearchFieldFocusNode;
  TextEditingController? customerSearchFieldController;
  String? Function(BuildContext, String?)?
      customerSearchFieldControllerValidator;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    customerSearchFieldFocusNode?.dispose();
    customerSearchFieldController?.dispose();

    amountFocusNode?.dispose();
    amountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
