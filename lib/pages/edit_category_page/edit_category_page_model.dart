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
import 'edit_category_page_widget.dart' show EditCategoryPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditCategoryPageModel extends FlutterFlowModel<EditCategoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for nameOfCategory widget.
  FocusNode? nameOfCategoryFocusNode;
  TextEditingController? nameOfCategoryController;
  String? Function(BuildContext, String?)? nameOfCategoryControllerValidator;
  String? _nameOfCategoryControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter the Category Name';
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
      return 'Enter the Second Language';
    }

    return null;
  }

  // State field(s) for index widget.
  FocusNode? indexFocusNode;
  TextEditingController? indexController;
  String? Function(BuildContext, String?)? indexControllerValidator;
  String? _indexControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Index';
    }

    return null;
  }

  // State field(s) for isParentCategory widget.
  bool? isParentCategoryValue;
  // State field(s) for parentCategory widget.
  String? parentCategoryValue;
  FormFieldController<String>? parentCategoryValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameOfCategoryControllerValidator = _nameOfCategoryControllerValidator;
    nameInSecondaryLangControllerValidator =
        _nameInSecondaryLangControllerValidator;
    indexControllerValidator = _indexControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    nameOfCategoryFocusNode?.dispose();
    nameOfCategoryController?.dispose();

    nameInSecondaryLangFocusNode?.dispose();
    nameInSecondaryLangController?.dispose();

    indexFocusNode?.dispose();
    indexController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
