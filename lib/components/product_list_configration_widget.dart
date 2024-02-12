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
import 'product_list_configration_model.dart';
export 'product_list_configration_model.dart';

class ProductListConfigrationWidget extends StatefulWidget {
  const ProductListConfigrationWidget({super.key});

  @override
  State<ProductListConfigrationWidget> createState() =>
      _ProductListConfigrationWidgetState();
}

class _ProductListConfigrationWidgetState
    extends State<ProductListConfigrationWidget> {
  late ProductListConfigrationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListConfigrationModel());

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Filter By',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: StreamBuilder<List<CategoriesRecord>>(
                  stream: queryCategoriesRecord(
                    parent: FFAppState().branchRef,
                    queryBuilder: (categoriesRecord) => categoriesRecord
                        .where(
                          'is_parent_category',
                          isEqualTo: false,
                        )
                        .orderBy('category_name'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<CategoriesRecord> dropDownCategoriesRecordList =
                        snapshot.data!;
                    return FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(
                        _model.dropDownValue ??= '',
                      ),
                      options: List<String>.from(dropDownCategoriesRecordList
                          .map((e) => e.categoryId)
                          .toList()),
                      optionLabels: dropDownCategoriesRecordList
                          .map((e) => e.categoryName)
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _model.dropDownValue = val),
                      width: double.infinity,
                      height: 50.0,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      hintText: 'Please select...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Avalailablity ',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Switch.adaptive(
                    value: _model.switchValue ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue = newValue!);
                    },
                    activeColor: FlutterFlowTheme.of(context).secondary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                    inactiveThumbColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (_model.dropDownValue != '') {
                    setState(() {
                      FFAppState().tempSubCategoryId = _model.dropDownValue!;
                      FFAppState().tempShowIf = _model.switchValue!;
                    });

                    context.pushNamed('customizableProductList');
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Invalid Input'),
                          content: Text('Please Select Some Sub Category'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                text: 'Submit',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.all(0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 14.0,
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
        ),
      ),
    );
  }
}
