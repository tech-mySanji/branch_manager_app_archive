import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_filter/empty_filter_widget.dart';
import '/components/purchase_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'product_list_filter_model.dart';
export 'product_list_filter_model.dart';

class ProductListFilterWidget extends StatefulWidget {
  const ProductListFilterWidget({super.key});

  @override
  State<ProductListFilterWidget> createState() =>
      _ProductListFilterWidgetState();
}

class _ProductListFilterWidgetState extends State<ProductListFilterWidget> {
  late ProductListFilterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductListFilterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('addProductsPage');
          },
          backgroundColor: FlutterFlowTheme.of(context).warning,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('homePage');
            },
          ),
          title: Text(
            'Products List',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Material(
                color: Colors.transparent,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 500.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            minHeight: 60.0,
                            maxHeight: 240.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FutureBuilder<List<VendorsRecord>>(
                              future: queryVendorsRecordOnce(
                                parent: FFAppState().branchRef,
                                queryBuilder: (vendorsRecord) =>
                                    vendorsRecord.orderBy('vendor_name'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<VendorsRecord> wrapVendorsRecordList =
                                    snapshot.data!;
                                return Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(
                                      wrapVendorsRecordList.length,
                                      (wrapIndex) {
                                    final wrapVendorsRecord =
                                        wrapVendorsRecordList[wrapIndex];
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        setState(() {
                                          _model.vendorSelected =
                                              wrapVendorsRecord.reference;
                                        });
                                      },
                                      text: wrapVendorsRecord.vendorName,
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: _model.vendorSelected ==
                                                wrapVendorsRecord.reference
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: _model.vendorSelected ==
                                                      wrapVendorsRecord
                                                          .reference
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryBtnText
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (_model.vendorSelected != null) {
                              return PagedListView<DocumentSnapshot<Object?>?,
                                  ProductsRecord>(
                                pagingController: _model.setListViewController(
                                    ProductsRecord.collection(
                                            FFAppState().branchRef)
                                        .where(
                                          'vendor_id',
                                          isEqualTo: _model.vendorSelected?.id,
                                        )
                                        .orderBy('product_name'),
                                    parent: FFAppState().branchRef),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                reverse: false,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<ProductsRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Customize what your widget looks like when it's loading another page.
                                  newPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  noItemsFoundIndicatorBuilder: (_) =>
                                      EmptyFilterWidget(
                                    vendorSelected: _model.vendorSelected!,
                                  ),
                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewProductsRecord = _model
                                        .listViewPagingController!
                                        .itemList![listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 16.0, 10.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          color: Colors.white,
                                          child: ExpandableNotifier(
                                            initialExpanded: false,
                                            child: ExpandablePanel(
                                              header: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  listViewProductsRecord
                                                      .productName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                      ),
                                                ),
                                              ),
                                              collapsed: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: PurchaseFieldWidget(
                                                    key: Key(
                                                        'Keykeg_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                                    productDoc:
                                                        listViewProductsRecord,
                                                  ),
                                                ),
                                              ),
                                              expanded: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child:
                                                          PurchaseFieldWidget(
                                                        key: Key(
                                                            'Keyu4l_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                                        productDoc:
                                                            listViewProductsRecord,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        if (listViewProductsRecord
                                                                .isOptionAvail ==
                                                            true)
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .boxes,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              size: 30.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 60.0,
                                                          icon: Icon(
                                                            Icons.mode_edit,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 30.0,
                                                          ),
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              'editProductPage',
                                                              queryParameters: {
                                                                'productDoc':
                                                                    serializeParam(
                                                                  listViewProductsRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'productDoc':
                                                                    listViewProductsRecord,
                                                              },
                                                            );
                                                          },
                                                        ),
                                                        if (listViewProductsRecord
                                                                .showIf ==
                                                            false)
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .remove_red_eye_sharp,
                                                              color: Color(
                                                                  0xFF0F8D0F),
                                                              size: 30.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await listViewProductsRecord
                                                                  .reference
                                                                  .update(
                                                                      createProductsRecordData(
                                                                showIf: true,
                                                              ));
                                                              setState(() {});
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Product Now Available to all',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        if (listViewProductsRecord
                                                                .showIf ==
                                                            true)
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .solidEyeSlash,
                                                              color: Color(
                                                                  0xFFD31C1C),
                                                              size: 25.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await listViewProductsRecord
                                                                  .reference
                                                                  .update(
                                                                      createProductsRecordData(
                                                                showIf: false,
                                                              ));
                                                              setState(() {});
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Product Now  Hidden to All',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 60.0,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .solidTrashAlt,
                                                            color: Color(
                                                                0xFFFF1212),
                                                            size: 30.0,
                                                          ),
                                                          onPressed: () async {
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Delete Product!'),
                                                                          content:
                                                                              Text('Are you sure you want to elete this product?'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: Text('Cancel'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: Text('Confirm'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              await listViewProductsRecord
                                                                  .reference
                                                                  .delete();
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                height: 400.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 350.0,
                                        height: 350.0,
                                        decoration: BoxDecoration(),
                                        child: Lottie.asset(
                                          'assets/lottie_animations/98121-empty-state.json',
                                          width: 350.0,
                                          height: 350.0,
                                          fit: BoxFit.scaleDown,
                                          animate: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Text(
                                          'Please select a category.',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
