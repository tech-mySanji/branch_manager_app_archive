import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'invoice_url_updater_widget.dart' show InvoiceUrlUpdaterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvoiceUrlUpdaterModel extends FlutterFlowModel<InvoiceUrlUpdaterWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for invoiceUrl widget.
  FocusNode? invoiceUrlFocusNode;
  TextEditingController? invoiceUrlController;
  String? Function(BuildContext, String?)? invoiceUrlControllerValidator;
  // State field(s) for invoice widget.
  FocusNode? invoiceFocusNode;
  TextEditingController? invoiceController;
  String? Function(BuildContext, String?)? invoiceControllerValidator;
  // State field(s) for outStanding widget.
  FocusNode? outStandingFocusNode;
  TextEditingController? outStandingController;
  String? Function(BuildContext, String?)? outStandingControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    invoiceUrlFocusNode?.dispose();
    invoiceUrlController?.dispose();

    invoiceFocusNode?.dispose();
    invoiceController?.dispose();

    outStandingFocusNode?.dispose();
    outStandingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
