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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'point_of_sale_model.dart';
export 'point_of_sale_model.dart';

class PointOfSaleWidget extends StatefulWidget {
  const PointOfSaleWidget({super.key});

  @override
  State<PointOfSaleWidget> createState() => _PointOfSaleWidgetState();
}

class _PointOfSaleWidgetState extends State<PointOfSaleWidget> {
  late PointOfSaleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PointOfSaleModel());

    _model.customerSearchFieldController ??= TextEditingController();
    _model.customerSearchFieldFocusNode ??= FocusNode();

    _model.productKeywordController ??= TextEditingController();
    _model.productKeywordFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            fillColor: FlutterFlowTheme.of(context).accent1,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('homePage');
            },
          ),
          title: Text(
            'Point of Sale',
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
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: 450.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Grand Total',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          functions.returnGrandTotal(
                                              FFAppState()
                                                  .tempCartItem
                                                  .toList()),
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                          currency: '₹ ',
                                        ),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 22.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: LatLng(0.0, 0.0));
                                  if ((FFAppState().tempCustomerName != null &&
                                          FFAppState().tempCustomerName !=
                                              '') &&
                                      (FFAppState().tempCartItem.length != 0)) {
                                    var ordersRecordReference =
                                        OrdersRecord.createDoc(
                                            FFAppState().branchRef!);
                                    await ordersRecordReference.set({
                                      ...createOrdersRecordData(
                                        address:
                                            FFAppState().tempCustomerAddress,
                                        phoneNumber: FFAppState()
                                            .tempCustomerPhoneNumber,
                                        paymentStatus: 'unpaid',
                                        userId: FFAppState().tempCustomerId,
                                        branchId: FFAppState().branchRef?.id,
                                        noOfPackage:
                                            FFAppState().tempCartItem.length,
                                        noOfDonePackage: 0,
                                        orderStatus: 'processing',
                                        total: functions.returnGrandTotal(
                                            FFAppState().tempCartItem.toList()),
                                        customerName:
                                            FFAppState().tempCustomerName,
                                        orderedTime: getCurrentTimestamp,
                                        invoiceNumber: '',
                                        location: currentUserLocationValue,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'packages':
                                              getCartItemListFirestoreData(
                                            FFAppState().tempCartItem,
                                          ),
                                        },
                                      ),
                                    });
                                    _model.newOrder =
                                        OrdersRecord.getDocumentFromData({
                                      ...createOrdersRecordData(
                                        address:
                                            FFAppState().tempCustomerAddress,
                                        phoneNumber: FFAppState()
                                            .tempCustomerPhoneNumber,
                                        paymentStatus: 'unpaid',
                                        userId: FFAppState().tempCustomerId,
                                        branchId: FFAppState().branchRef?.id,
                                        noOfPackage:
                                            FFAppState().tempCartItem.length,
                                        noOfDonePackage: 0,
                                        orderStatus: 'processing',
                                        total: functions.returnGrandTotal(
                                            FFAppState().tempCartItem.toList()),
                                        customerName:
                                            FFAppState().tempCustomerName,
                                        orderedTime: getCurrentTimestamp,
                                        invoiceNumber: '',
                                        location: currentUserLocationValue,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'packages':
                                              getCartItemListFirestoreData(
                                            FFAppState().tempCartItem,
                                          ),
                                        },
                                      ),
                                    }, ordersRecordReference);

                                    await _model.newOrder!.reference
                                        .update(createOrdersRecordData(
                                      orderId: _model.newOrder?.reference.id,
                                    ));
                                    setState(() {
                                      FFAppState().tempCustomerName = '';
                                      FFAppState().tempProductName = '';
                                      FFAppState().tempProductId = '';
                                      FFAppState().tempCustomerId = '';
                                      FFAppState().tempCustomerPhoneNumber = '';
                                      FFAppState().tempCartItem = [];
                                      FFAppState().tempCart = CartItemStruct();
                                      FFAppState().tempCustomerAddress = '';
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Order Placed Successfully',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Items or Customers is missing',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  }

                                  setState(() {});
                                },
                                text: 'Submit',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 55.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 14.0,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 4.0),
                          child: Text(
                            'Select Customer',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 12.0,
                                ),
                          ),
                        ),
                        if (FFAppState().tempCustomerName != null &&
                            FFAppState().tempCustomerName != '')
                          Container(
                            width: 396.9,
                            height: 110.0,
                            decoration: BoxDecoration(
                              color: Color(0x0FF2CB05),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFAppState().tempCustomerName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 50.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.windowClose,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            FFAppState().tempCustomerId = '';
                                            FFAppState()
                                                .tempCustomerPhoneNumber = '';
                                            FFAppState().tempCustomerName = '';
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            FFAppState()
                                                .tempCustomerPhoneNumber,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (FFAppState().tempCustomerName == null ||
                            FFAppState().tempCustomerName == '')
                          Container(
                            width: 453.3,
                            height: 55.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.customerSearchFieldController,
                                      focusNode:
                                          _model.customerSearchFieldFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            'Search by  Customer Phone Number',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      validator: _model
                                          .customerSearchFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 55.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.search,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    if (_model.customerSearchFieldController
                                            .text !=
                                        '') {
                                      _model.singleDoc =
                                          await queryUsersRecordOnce(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'phone_number',
                                          isEqualTo:
                                              '+91${_model.customerSearchFieldController.text}',
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.singleDoc?.displayName !=
                                              null &&
                                          _model.singleDoc?.displayName != '') {
                                        setState(() {
                                          FFAppState().tempCustomerName =
                                              _model.singleDoc!.displayName;
                                          FFAppState().tempCustomerId =
                                              _model.singleDoc!.uid;
                                          FFAppState().tempCustomerPhoneNumber =
                                              _model.singleDoc!.phoneNumber;
                                          FFAppState().tempCustomerAddress =
                                              _model.singleDoc!.address;
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'No Customer Found',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                    }

                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 4.0),
                          child: Text(
                            'Add Product Name',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 12.0,
                                ),
                          ),
                        ),
                        if (FFAppState().tempCart.productName != null &&
                            FFAppState().tempCart.productName != '')
                          Container(
                            width: double.infinity,
                            height: 55.0,
                            decoration: BoxDecoration(
                              color: Color(0x0FF2CB05),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFAppState().tempCart.productName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  icon: FaIcon(
                                    FontAwesomeIcons.windowClose,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      FFAppState().tempCart = CartItemStruct();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        if (FFAppState().tempCart.productName == null ||
                            FFAppState().tempCart.productName == '')
                          Container(
                            width: 453.3,
                            height: 55.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.productKeywordController,
                                      focusNode: _model.productKeywordFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Search by  Product Name',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                      validator: _model
                                          .productKeywordControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 55.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.search,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    if (_model.productKeywordController.text !=
                                        '') {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.8,
                                                child: ProductSearchListWidget(
                                                  searchKey: _model
                                                      .productKeywordController
                                                      .text,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Name is Empty',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 166.1,
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController3,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Quantity',
                                        hintText: 'Quantity',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              signed: true, decimal: true),
                                      validator: _model.textController3Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 160.4,
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFAppState().tempCart.sellingPrice !=
                                                  null
                                              ? FFAppState()
                                                  .tempCart
                                                  .sellingPrice
                                                  .toString()
                                              : 'Price',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if ((_model.textController3.text != '') &&
                                  (FFAppState().tempCart.productName != null &&
                                      FFAppState().tempCart.productName !=
                                          '')) {
                                setState(() {
                                  FFAppState().updateTempCartStruct(
                                    (e) => e
                                      ..quantity = double.tryParse(
                                          _model.textController3.text),
                                  );
                                });
                                setState(() {
                                  FFAppState()
                                      .addToTempCartItem(FFAppState().tempCart);
                                });
                                setState(() {
                                  FFAppState().tempCart = CartItemStruct();
                                });
                                setState(() {
                                  _model.textController3?.clear();
                                  _model.productKeywordController?.clear();
                                });
                              }
                            },
                            text: 'Add Item',
                            options: FFButtonOptions(
                              width: 130.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 4.0),
                          child: Text(
                            'Added Items',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 12.0,
                                ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final listOfItem =
                                FFAppState().tempCartItem.toList();
                            if (listOfItem.isEmpty) {
                              return Center(
                                child: EmptySearchWidget(),
                              );
                            }
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(listOfItem.length,
                                  (listOfItemIndex) {
                                final listOfItemItem =
                                    listOfItem[listOfItemIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  listOfItemItem.productName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 45.0,
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Color(0xFFB51414),
                                                  size: 25.0,
                                                ),
                                                onPressed: () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .removeAtIndexFromTempCartItem(
                                                            listOfItemIndex);
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Item Removed Successfully',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${listOfItemItem.quantity.toString()}   ${listOfItemItem.unit}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                ),
                                                Text(
                                                  formatNumber(
                                                    listOfItemItem.quantity *
                                                        listOfItemItem
                                                            .sellingPrice,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                    currency: '₹ ',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
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
