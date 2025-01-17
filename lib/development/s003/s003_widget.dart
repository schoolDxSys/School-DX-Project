import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 's003_model.dart';
export 's003_model.dart';

class S003Widget extends StatefulWidget {
  const S003Widget({super.key});

  @override
  State<S003Widget> createState() => _S003WidgetState();
}

class _S003WidgetState extends State<S003Widget> {
  late S003Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => S003Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.qrCodeValue = await FlutterBarcodeScanner.scanBarcode(
        '#C62828', // scanning line color
        'Cancel', // cancel button text
        true, // whether to show the flash icon
        ScanMode.QR,
      );

      _model.isQRSecret = await queryOnetimeRecordOnce(
        queryBuilder: (onetimeRecord) => onetimeRecord.where(
          'qrSerial',
          isEqualTo: _model.qrCodeValue,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.isQRSecret?.hasQrSerial() == true) {
        _model.subjectData = await querySubjectRecordOnce(
          queryBuilder: (subjectRecord) => subjectRecord.where(
            'serial',
            isEqualTo: _model.isQRSecret?.serial,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);

        context.pushNamed(
          'S005',
          queryParameters: {
            'qrSecret': serializeParam(
              _model.subjectData?.serial,
              ParamType.String,
            ),
            'subjectName': serializeParam(
              _model.subjectData?.subjectName,
              ParamType.String,
            ),
            'subjectTime': serializeParam(
              _model.subjectData?.subjectDate,
              ParamType.String,
            ),
          }.withoutNulls,
        );

        return;
      } else {
        context.pushNamed(
          'errror',
          queryParameters: {
            'errorTitle': serializeParam(
              '情報の取得に失敗しました',
              ParamType.String,
            ),
            'errorMessage': serializeParam(
              '接続を確認してもう一度お試しください',
              ParamType.String,
            ),
          }.withoutNulls,
        );

        return;
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
      ),
    );
  }
}
