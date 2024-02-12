import '/components/product_search_list/product_search_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_option_widget.dart' show AddOptionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddOptionModel extends FlutterFlowModel<AddOptionWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameController;
  String? Function(BuildContext, String?)? productNameControllerValidator;
  // State field(s) for optionName widget.
  FocusNode? optionNameFocusNode;
  TextEditingController? optionNameController;
  String? Function(BuildContext, String?)? optionNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    productNameFocusNode?.dispose();
    productNameController?.dispose();

    optionNameFocusNode?.dispose();
    optionNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
