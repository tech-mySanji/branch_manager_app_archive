import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_search_list_model.dart';
export 'product_search_list_model.dart';

class ProductSearchListWidget extends StatefulWidget {
  const ProductSearchListWidget({
    super.key,
    required this.searchKey,
  });

  final String? searchKey;

  @override
  State<ProductSearchListWidget> createState() =>
      _ProductSearchListWidgetState();
}

class _ProductSearchListWidgetState extends State<ProductSearchListWidget> {
  late ProductSearchListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductSearchListModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 523.5,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
          child: StreamBuilder<List<ProductsRecord>>(
            stream: queryProductsRecord(
              parent: FFAppState().branchRef,
              queryBuilder: (productsRecord) => productsRecord.where(
                'keyword',
                arrayContains: widget.searchKey,
              ),
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
              List<ProductsRecord> listViewProductsRecordList = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewProductsRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewProductsRecord =
                      listViewProductsRecordList[listViewIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().updateTempCartStruct(
                            (e) => e
                              ..barcode = listViewProductsRecord.barcode
                              ..productName = listViewProductsRecord.productName
                              ..vendorId = listViewProductsRecord.vendorId
                              ..deliveryAgentId =
                                  listViewProductsRecord.deliveryAgentId
                              ..productId = listViewProductsRecord.productId
                              ..sellingPrice =
                                  listViewProductsRecord.sellingPrice
                              ..subCategoryId =
                                  listViewProductsRecord.subCategoryId
                              ..quantity =
                                  listViewProductsRecord.incrementalQuantity
                              ..unit = listViewProductsRecord.unit
                              ..productNameSecondary =
                                  listViewProductsRecord.productNameSecondary
                              ..incrementalQuantity =
                                  listViewProductsRecord.incrementalQuantity
                              ..minimumQuantity =
                                  listViewProductsRecord.minimumQuantity
                              ..addedTime = getCurrentTimestamp,
                          );
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    listViewProductsRecord.productName,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 16.0),
                              child: Text(
                                listViewProductsRecord.productNameSecondary,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
