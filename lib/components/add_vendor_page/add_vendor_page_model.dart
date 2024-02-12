import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_vendor_page_widget.dart' show AddVendorPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddVendorPageModel extends FlutterFlowModel<AddVendorPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for vendorName widget.
  FocusNode? vendorNameFocusNode;
  TextEditingController? vendorNameController;
  String? Function(BuildContext, String?)? vendorNameControllerValidator;
  String? _vendorNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Vendor Name';
    }

    return null;
  }

  // State field(s) for shopName widget.
  FocusNode? shopNameFocusNode;
  TextEditingController? shopNameController;
  String? Function(BuildContext, String?)? shopNameControllerValidator;
  String? _shopNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Shop Name';
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

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
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

  // State field(s) for vendorEditPurchasePrice widget.
  bool? vendorEditPurchasePriceValue;
  // State field(s) for vendorEditPurchaseQuantity widget.
  bool? vendorEditPurchaseQuantityValue;
  // Stores action output result for [Backend Call - API (vendorCreate)] action in Button widget.
  ApiCallResponse? apiResultuwr;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vendorNameControllerValidator = _vendorNameControllerValidator;
    shopNameControllerValidator = _shopNameControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
    emailIdControllerValidator = _emailIdControllerValidator;
    addressControllerValidator = _addressControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    vendorNameFocusNode?.dispose();
    vendorNameController?.dispose();

    shopNameFocusNode?.dispose();
    shopNameController?.dispose();

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
