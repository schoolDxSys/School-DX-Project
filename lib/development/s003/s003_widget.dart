import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

      context.pushNamed(
        'S005',
        queryParameters: {
          'qrdata': serializeParam(
            _model.qrCodeValue,
            ParamType.String,
          ),
        }.withoutNulls,
      );
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
