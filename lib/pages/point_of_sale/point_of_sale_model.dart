import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_search_widget.dart';
import '/components/product_search_list/product_search_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'point_of_sale_widget.dart' show PointOfSaleWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PointOfSaleModel extends FlutterFlowModel<PointOfSaleWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? newOrder;
  // State field(s) for customerSearchField widget.
  FocusNode? customerSearchFieldFocusNode;
  TextEditingController? customerSearchFieldController;
  String? Function(BuildContext, String?)?
      customerSearchFieldControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  UsersRecord? singleDoc;
  // State field(s) for productKeyword widget.
  FocusNode? productKeywordFocusNode;
  TextEditingController? productKeywordController;
  String? Function(BuildContext, String?)? productKeywordControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    customerSearchFieldFocusNode?.dispose();
    customerSearchFieldController?.dispose();

    productKeywordFocusNode?.dispose();
    productKeywordController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
