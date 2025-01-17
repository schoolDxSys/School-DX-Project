import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 't003_model.dart';
export 't003_model.dart';

class T003Widget extends StatefulWidget {
  const T003Widget({
    super.key,
    String? collageName,
  }) : collageName = collageName ?? 'IS';

  final String collageName;

  @override
  State<T003Widget> createState() => _T003WidgetState();
}

class _T003WidgetState extends State<T003Widget> {
  late T003Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => T003Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<SubjectListRecord>>(
      stream: querySubjectListRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<SubjectListRecord> t003SubjectListRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            drawer: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.5,
              child: const Drawer(
                elevation: 16.0,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: custom_widgets.SafeDrawerWidget(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 66.0,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 49.0,
                ),
                onPressed: () async {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.person_2_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 40.0,
                      ),
                      Text(
                        '${valueOrDefault<String>(
                          FFAppState().user.userName,
                          'ななし',
                        )} さん',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(34.0, 122.0, 0.0, 0.0),
                      child: Text(
                        '科目を選択してください',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Karma',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController1 ??=
                          FormFieldController<String>(null),
                      options: t003SubjectListRecordList
                          .map((e) => e.subjectName)
                          .toList(),
                      onChanged: (val) =>
                          safeSetState(() => _model.dropDownValue1 = val),
                      width: 350.0,
                      height: 50.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                letterSpacing: 2.0,
                              ),
                      hintText: 'Select...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: Colors.transparent,
                      borderWidth: 20.0,
                      borderRadius: 8.0,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(34.0, 10.0, 0.0, 0.0),
                      child: Text(
                        '時間を選択してください',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Karma',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: StreamBuilder<List<SubjectTimeRecord>>(
                      stream: querySubjectTimeRecord(
                        singleRecord: true,
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
                        List<SubjectTimeRecord> dropDownSubjectTimeRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final dropDownSubjectTimeRecord =
                            dropDownSubjectTimeRecordList.isNotEmpty
                                ? dropDownSubjectTimeRecordList.first
                                : null;

                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController2 ??=
                              FormFieldController<String>(null),
                          options: dropDownSubjectTimeRecord!.subjectTime,
                          onChanged: (val) =>
                              safeSetState(() => _model.dropDownValue2 = val),
                          width: 350.0,
                          height: 50.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 2.0,
                                  ),
                          hintText: 'Select...',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.uuid = await actions.createUuid(
                          '',
                        );

                        var subjectRecordReference =
                            SubjectRecord.collection.doc();
                        await subjectRecordReference
                            .set(createSubjectRecordData(
                          subjectName: _model.dropDownValue1,
                          serial: _model.uuid,
                          date: getCurrentTimestamp,
                          subjectDate: _model.dropDownValue2,
                        ));
                        _model.nowSubjectDate =
                            SubjectRecord.getDocumentFromData(
                                createSubjectRecordData(
                                  subjectName: _model.dropDownValue1,
                                  serial: _model.uuid,
                                  date: getCurrentTimestamp,
                                  subjectDate: _model.dropDownValue2,
                                ),
                                subjectRecordReference);

                        context.pushNamed(
                          'T002',
                          queryParameters: {
                            'subjectName': serializeParam(
                              _model.nowSubjectDate?.subjectName,
                              ParamType.String,
                            ),
                            'subjectDate': serializeParam(
                              _model.nowSubjectDate?.subjectDate,
                              ParamType.String,
                            ),
                            'serial': serializeParam(
                              _model.uuid,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );

                        safeSetState(() {});
                      },
                      text: 'QR生成',
                      icon: const Icon(
                        Icons.qr_code,
                        size: 50.0,
                      ),
                      options: FFButtonOptions(
                        width: 350.0,
                        height: 80.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
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
  }
}
