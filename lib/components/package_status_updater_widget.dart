import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package_status_updater_model.dart';
export 'package_status_updater_model.dart';

class PackageStatusUpdaterWidget extends StatefulWidget {
  const PackageStatusUpdaterWidget({
    super.key,
    required this.packageDocument,
  });

  final PackagesRecord? packageDocument;

  @override
  State<PackageStatusUpdaterWidget> createState() =>
      _PackageStatusUpdaterWidgetState();
}

class _PackageStatusUpdaterWidgetState
    extends State<PackageStatusUpdaterWidget> {
  late PackageStatusUpdaterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PackageStatusUpdaterModel());

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
      height: 654.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FFButtonWidget(
              onPressed: () async {
                await widget.packageDocument!.reference
                    .update(createPackagesRecordData(
                  status: 'pending',
                ));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Status Updated',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: Color(0xFF068C1A),
                  ),
                );
              },
              text: 'Pending',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await widget.packageDocument!.reference
                      .update(createPackagesRecordData(
                    status: 'packed',
                  ));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Status Updated',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: Color(0xFF068C1A),
                    ),
                  );
                },
                text: 'Packed',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await widget.packageDocument!.reference
                      .update(createPackagesRecordData(
                    status: 'picked',
                  ));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Status Updated',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: Color(0xFF068C1A),
                    ),
                  );
                },
                text: 'Picked',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await widget.packageDocument!.reference
                      .update(createPackagesRecordData(
                    status: 'delivered',
                  ));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Status Updated',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: Color(0xFF068C1A),
                    ),
                  );
                },
                text: 'Delivered',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF068C1A),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await widget.packageDocument!.reference
                      .update(createPackagesRecordData(
                    status: 'canceled',
                  ));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Status Updated',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: Color(0xFF068C1A),
                    ),
                  );
                },
                text: 'Canceled',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFD31C1C),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).accent2,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
