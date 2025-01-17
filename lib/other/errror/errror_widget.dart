import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'errror_model.dart';
export 'errror_model.dart';

class ErrrorWidget extends StatefulWidget {
  const ErrrorWidget({
    super.key,
    String? errorTitle,
    String? errorButton,
    bool? hideButton,
    String? errorMessage,
  })  : errorTitle = errorTitle ?? '不明なエラーが発生しました',
        errorButton = errorButton ?? '再試行',
        hideButton = hideButton ?? false,
        errorMessage = errorMessage ?? ' ';

  final String errorTitle;
  final String errorButton;
  final bool hideButton;
  final String errorMessage;

  @override
  State<ErrrorWidget> createState() => _ErrrorWidgetState();
}

class _ErrrorWidgetState extends State<ErrrorWidget> {
  late ErrrorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErrrorModel());
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
        body: SafeArea(
          top: true,
          child: Column(
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
                    widget.errorTitle,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Karma',
                          color: FlutterFlowTheme.of(context).error,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  widget.errorMessage,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Karma',
                        color: FlutterFlowTheme.of(context).error,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: widget.hideButton
                        ? null
                        : () async {
                            context.safePop();
                          },
                    text: widget.errorButton,
                    options: FFButtonOptions(
                      width: widget.hideButton ? 0.0 : 100.0,
                      height: widget.hideButton ? 0.0 : 46.88,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      iconAlignment: IconAlignment.start,
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 12.9, 20.0, 5.96),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
      ),
    );
  }
}
