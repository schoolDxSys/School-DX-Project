import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 's003e_model.dart';
export 's003e_model.dart';

class S003eWidget extends StatefulWidget {
  const S003eWidget({super.key});

  @override
  State<S003eWidget> createState() => _S003eWidgetState();
}

class _S003eWidgetState extends State<S003eWidget> {
  late S003eModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => S003eModel());
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(150.0, 301.0, 150.0, 0.0),
                child: FaIcon(
                  FontAwesomeIcons.exclamationTriangle,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 80.0,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                child: Text(
                  '情報の取得に失敗しました',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Karma',
                        color: FlutterFlowTheme.of(context).error,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Text(
              '接続を確認してもう一度お試しください',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Karma',
                    color: FlutterFlowTheme.of(context).error,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('S002');
                  },
                  text: '再試行',
                  options: FFButtonOptions(
                    width: 100.0,
                    height: 46.88,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    iconAlignment: IconAlignment.start,
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 12.9, 20.0, 5.96),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Karma',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
