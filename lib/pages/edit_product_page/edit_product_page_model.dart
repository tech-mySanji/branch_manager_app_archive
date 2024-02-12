import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_product_page_widget.dart' show EditProductPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProductPageModel extends FlutterFlowModel<EditProductPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for barcode widget.
  FocusNode? barcodeFocusNode;
  TextEditingController? barcodeController;
  String? Function(BuildContext, String?)? barcodeControllerValidator;
  String? _barcodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Barcode';
    }

    return null;
  }

  // State field(s) for nameOfProduct widget.
  FocusNode? nameOfProductFocusNode;
  TextEditingController? nameOfProductController;
  String? Function(BuildContext, String?)? nameOfProductControllerValidator;
  String? _nameOfProductControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Product Name';
    }

    return null;
  }

  // State field(s) for nameInSecondaryLang widget.
  FocusNode? nameInSecondaryLangFocusNode;
  TextEditingController? nameInSecondaryLangController;
  String? Function(BuildContext, String?)?
      nameInSecondaryLangControllerValidator;
  String? _nameInSecondaryLangControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Second Name';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  String? _descriptionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the description';
    }

    return null;
  }

  // State field(s) for index widget.
  FocusNode? indexFocusNode;
  TextEditingController? indexController;
  String? Function(BuildContext, String?)? indexControllerValidator;
  String? _indexControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Index';
    }

    return null;
  }

  // State field(s) for incrementalQuantity widget.
  FocusNode? incrementalQuantityFocusNode;
  TextEditingController? incrementalQuantityController;
  String? Function(BuildContext, String?)?
      incrementalQuantityControllerValidator;
  String? _incrementalQuantityControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Incremental Quantity';
    }

    return null;
  }

  // State field(s) for minimumQuantity widget.
  FocusNode? minimumQuantityFocusNode;
  TextEditingController? minimumQuantityController;
  String? Function(BuildContext, String?)? minimumQuantityControllerValidator;
  String? _minimumQuantityControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Minimum Quantity';
    }

    return null;
  }

  // State field(s) for mrp widget.
  FocusNode? mrpFocusNode;
  TextEditingController? mrpController;
  String? Function(BuildContext, String?)? mrpControllerValidator;
  String? _mrpControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the MRP';
    }

    return null;
  }

  // State field(s) for purchasePrice widget.
  FocusNode? purchasePriceFocusNode;
  TextEditingController? purchasePriceController;
  String? Function(BuildContext, String?)? purchasePriceControllerValidator;
  String? _purchasePriceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Purchase Price';
    }

    return null;
  }

  // State field(s) for margin widget.
  FocusNode? marginFocusNode;
  TextEditingController? marginController;
  String? Function(BuildContext, String?)? marginControllerValidator;
  String? _marginControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Margin';
    }

    return null;
  }

  // State field(s) for marginType widget.
  String? marginTypeValue;
  FormFieldController<String>? marginTypeValueController;
  // State field(s) for unit widget.
  String? unitValue;
  FormFieldController<String>? unitValueController;
  // State field(s) for vendorId widget.
  String? vendorIdValue;
  FormFieldController<String>? vendorIdValueController;
  // State field(s) for deliveryAgent widget.
  String? deliveryAgentValue;
  FormFieldController<String>? deliveryAgentValueController;
  // State field(s) for subCategoryId widget.
  String? subCategoryIdValue;
  FormFieldController<String>? subCategoryIdValueController;
  // State field(s) for isOptionAvail widget.
  bool? isOptionAvailValue;
  // State field(s) for showIf widget.
  bool? showIfValue;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    barcodeControllerValidator = _barcodeControllerValidator;
    nameOfProductControllerValidator = _nameOfProductControllerValidator;
    nameInSecondaryLangControllerValidator =
        _nameInSecondaryLangControllerValidator;
    descriptionControllerValidator = _descriptionControllerValidator;
    indexControllerValidator = _indexControllerValidator;
    incrementalQuantityControllerValidator =
        _incrementalQuantityControllerValidator;
    minimumQuantityControllerValidator = _minimumQuantityControllerValidator;
    mrpControllerValidator = _mrpControllerValidator;
    purchasePriceControllerValidator = _purchasePriceControllerValidator;
    marginControllerValidator = _marginControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    barcodeFocusNode?.dispose();
    barcodeController?.dispose();

    nameOfProductFocusNode?.dispose();
    nameOfProductController?.dispose();

    nameInSecondaryLangFocusNode?.dispose();
    nameInSecondaryLangController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    indexFocusNode?.dispose();
    indexController?.dispose();

    incrementalQuantityFocusNode?.dispose();
    incrementalQuantityController?.dispose();

    minimumQuantityFocusNode?.dispose();
    minimumQuantityController?.dispose();

    mrpFocusNode?.dispose();
    mrpController?.dispose();

    purchasePriceFocusNode?.dispose();
    purchasePriceController?.dispose();

    marginFocusNode?.dispose();
    marginController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
