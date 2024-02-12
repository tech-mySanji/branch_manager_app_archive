import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_user_page_widget.dart' show EditUserPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditUserPageModel extends FlutterFlowModel<EditUserPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  String? _userNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Name';
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

  // State field(s) for pincode widget.
  FocusNode? pincodeFocusNode;
  TextEditingController? pincodeController;
  String? Function(BuildContext, String?)? pincodeControllerValidator;
  String? _pincodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Pincode';
    }

    return null;
  }

  // State field(s) for referralName widget.
  FocusNode? referralNameFocusNode;
  TextEditingController? referralNameController;
  String? Function(BuildContext, String?)? referralNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userNameControllerValidator = _userNameControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
    addressControllerValidator = _addressControllerValidator;
    pincodeControllerValidator = _pincodeControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    userNameFocusNode?.dispose();
    userNameController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    addressFocusNode?.dispose();
    addressController?.dispose();

    pincodeFocusNode?.dispose();
    pincodeController?.dispose();

    referralNameFocusNode?.dispose();
    referralNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
