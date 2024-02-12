import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'invoice_number_updater_widget.dart' show InvoiceNumberUpdaterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InvoiceNumberUpdaterModel
    extends FlutterFlowModel<InvoiceNumberUpdaterWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for invoiceNumber widget.
  FocusNode? invoiceNumberFocusNode;
  TextEditingController? invoiceNumberController;
  String? Function(BuildContext, String?)? invoiceNumberControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    invoiceNumberFocusNode?.dispose();
    invoiceNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
