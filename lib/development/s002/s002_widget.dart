import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 's002_model.dart';
export 's002_model.dart';

class S002Widget extends StatefulWidget {
  const S002Widget({super.key});

  @override
  State<S002Widget> createState() => _S002WidgetState();
}

class _S002WidgetState extends State<S002Widget> {
  late S002Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => S002Model());
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
        backgroundColor: Colors.white,
        drawer: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: const Drawer(
            elevation: 16.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: AppBar(
            backgroundColor: const Color(0x3B000000),
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(9.3, 0.0, 0.0, 8.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 0.0,
                          buttonSize: 65.0,
                          icon: Icon(
                            Icons.list,
                            color: FlutterFlowTheme.of(context).info,
                            size: 49.0,
                          ),
                          onPressed: () async {
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: false,
              expandedTitleScale: 1.0,
            ),
            toolbarHeight: 20.0,
            elevation: 0.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(30.0, 132.0, 0.0, 0.0),
                child: Text(
                  'ようこそ！',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'RocknRoll One',
                        color: const Color(0xFF555555),
                        fontSize: 40.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('S003');
                  },
                  text: 'QRスキャン',
                  options: FFButtonOptions(
                    width: 359.0,
                    height: 150.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color(0xFF555555),
                          fontSize: 24.0,
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
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 33.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: '学生証',
                  options: FFButtonOptions(
                    width: 359.0,
                    height: 150.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: const Color(0xFF555555),
                          fontSize: 24.0,
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
            ),
          ],
        ),
      ),
    );
  }
}
