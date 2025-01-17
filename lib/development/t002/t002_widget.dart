import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 't002_model.dart';
export 't002_model.dart';

class T002Widget extends StatefulWidget {
  const T002Widget({
    super.key,
    required this.subjectName,
    required this.subjectDate,
    required this.serial,
    bool? playOnetime,
  }) : playOnetime = playOnetime ?? true;

  final String? subjectName;
  final String? subjectDate;
  final String? serial;
  final bool playOnetime;

  @override
  State<T002Widget> createState() => _T002WidgetState();
}

class _T002WidgetState extends State<T002Widget> {
  late T002Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => T002Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.qrSerial = await actions.encrypt(
        widget.serial,
        random_data.randomString(
          4,
          4,
          true,
          true,
          false,
        ),
      );

      await OnetimeRecord.collection.doc().set(createOnetimeRecordData(
            serial: widget.serial,
            qrSerial: _model.qrSerial,
          ));
      while (widget.playOnetime) {
        await Future.delayed(const Duration(milliseconds: 10000));
        _model.oldData = await queryOnetimeRecordOnce(
          queryBuilder: (onetimeRecord) => onetimeRecord.where(
            'serial',
            isEqualTo: widget.serial,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.newQrSerial = await actions.encrypt(
          widget.serial,
          random_data.randomString(
            4,
            4,
            true,
            true,
            false,
          ),
        );

        await _model.oldData!.reference.update(createOnetimeRecordData(
          qrSerial: _model.newQrSerial,
        ));
      }
    });
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('T001');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 230.0, 0.0, 0.0),
                child: BarcodeWidget(
                  data: _model.newQrSerial!,
                  barcode: Barcode.qrCode(),
                  width: 200.0,
                  height: 200.0,
                  color: FlutterFlowTheme.of(context).primaryText,
                  backgroundColor: Colors.transparent,
                  errorBuilder: (context, error) => const SizedBox(
                    width: 200.0,
                    height: 200.0,
                  ),
                  drawText: true,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.subjectName,
                      'Nan',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'RocknRoll One',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 36.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.subjectDate,
                      'Nan',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'RocknRoll One',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 36.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
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
