import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_delivery_agent_widget.dart' show EditDeliveryAgentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditDeliveryAgentModel extends FlutterFlowModel<EditDeliveryAgentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Name';
    }

    return null;
  }

  // State field(s) for aadharNumber widget.
  FocusNode? aadharNumberFocusNode;
  TextEditingController? aadharNumberController;
  String? Function(BuildContext, String?)? aadharNumberControllerValidator;
  String? _aadharNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Aadhar Number';
    }

    return null;
  }

  // State field(s) for licenseNumber widget.
  FocusNode? licenseNumberFocusNode;
  TextEditingController? licenseNumberController;
  String? Function(BuildContext, String?)? licenseNumberControllerValidator;
  String? _licenseNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the License Number';
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Phone Number';
    }

    return null;
  }

  // State field(s) for emailId widget.
  FocusNode? emailIdFocusNode;
  TextEditingController? emailIdController;
  String? Function(BuildContext, String?)? emailIdControllerValidator;
  String? _emailIdControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Email';
    }

    return null;
  }

  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  String? _addressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Address';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    aadharNumberControllerValidator = _aadharNumberControllerValidator;
    licenseNumberControllerValidator = _licenseNumberControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
    emailIdControllerValidator = _emailIdControllerValidator;
    addressControllerValidator = _addressControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    aadharNumberFocusNode?.dispose();
    aadharNumberController?.dispose();

    licenseNumberFocusNode?.dispose();
    licenseNumberController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    emailIdFocusNode?.dispose();
    emailIdController?.dispose();

    addressFocusNode?.dispose();
    addressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
