import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 's005_model.dart';
export 's005_model.dart';

class S005Widget extends StatefulWidget {
  const S005Widget({
    super.key,
    String? qrdata,
  }) : qrdata = qrdata ?? 'null';

  final String qrdata;

  @override
  State<S005Widget> createState() => _S005WidgetState();
}

class _S005WidgetState extends State<S005Widget> {
  late S005Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => S005Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xfffffffffff),
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 201.0, 0.0, 0.0),
                  child: Text(
                    '登録しますか？',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Karma',
                          fontSize: 40.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 141.0, 0.0, 0.0),
                  child: Text(
                    '教科名',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Karma',
                          fontSize: 40.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Text(
                  widget.qrdata,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Karma',
                        fontSize: 40.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 61.0, 0.0, 367.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('S006');
                          },
                          text: 'はい',
                          options: FFButtonOptions(
                            width: 126.58,
                            height: 51.15,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(31.0, 0.0, 8.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('S002');
                          },
                          text: 'いいえ',
                          options: FFButtonOptions(
                            width: 126.51,
                            height: 50.15,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
