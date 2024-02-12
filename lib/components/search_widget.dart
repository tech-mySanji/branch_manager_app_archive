import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.productDoc,
  });

  final ProductsRecord? productDoc;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Invoic',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                    ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.cancel_outlined,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 10.0),
          child: FlutterFlowDropDown<String>(
            controller: _model.dropDownValueController1 ??=
                FormFieldController<String>(null),
            options: <String>[],
            onChanged: (val) => setState(() => _model.dropDownValue1 = val),
            width: double.infinity,
            height: 55.0,
            textStyle: FlutterFlowTheme.of(context).bodyMedium,
            hintText: 'List of Sub Category',
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 2.0,
            borderColor: FlutterFlowTheme.of(context).primaryText,
            borderWidth: 2.0,
            borderRadius: 8.0,
            margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
            hidesUnderline: true,
            isSearchable: false,
            isMultiSelect: false,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 15.0),
          child: FlutterFlowDropDown<String>(
            controller: _model.dropDownValueController2 ??=
                FormFieldController<String>(null),
            options: ['yes', 'no'],
            onChanged: (val) => setState(() => _model.dropDownValue2 = val),
            width: double.infinity,
            height: 55.0,
            textStyle: FlutterFlowTheme.of(context).bodyMedium,
            hintText: 'Availablity ',
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 2.0,
            borderColor: FlutterFlowTheme.of(context).primaryText,
            borderWidth: 2.0,
            borderRadius: 8.0,
            margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
            hidesUnderline: true,
            isSearchable: false,
            isMultiSelect: false,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: 'Submit',
            options: FFButtonOptions(
              width: double.infinity,
              height: 55.0,
              padding: EdgeInsets.all(0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
