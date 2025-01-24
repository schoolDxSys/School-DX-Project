import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 's001_model.dart';
export 's001_model.dart';

class S001Widget extends StatefulWidget {
  const S001Widget({
    super.key,
    this.loginId,
    this.loginPassword,
  });

  final String? loginId;
  final String? loginPassword;

  @override
  State<S001Widget> createState() => _S001WidgetState();
}

class _S001WidgetState extends State<S001Widget> {
  late S001Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => S001Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.deviceId = await actions.getDeviceId();
      _model.searchUserWithDevice = await queryUserRecordOnce(
        queryBuilder: (userRecord) => userRecord.where(
          'deviceId',
          isEqualTo: _model.deviceId?.deviceId,
        ),
      );
      if (_model.searchUserWithDevice?.length == 1) {
        await _model.searchUserWithDevice!.firstOrNull!.reference
            .update(createUserRecordData(
          lastLogin: getCurrentTimestamp,
        ));
        FFAppState().user = UserStruct(
          userId: _model.searchUserWithDevice?.firstOrNull?.userId,
          userName: _model.searchUserWithDevice?.firstOrNull?.userName,
          deviceId: _model.deviceId,
          isTeacher: _model.searchUserWithDevice?.firstOrNull?.isTeacher,
        );
        safeSetState(() {});

        context.goNamed('S002');

        return;
      } else {
        if (_model.searchUserWithDevice?.length == 0) {
          return;
        }

        context.goNamed(
          'errror',
          queryParameters: {
            'errorTitle': serializeParam(
              'データベース内にエラーが発生しました',
              ParamType.String,
            ),
            'hideButton': serializeParam(
              true,
              ParamType.bool,
            ),
            'errorMessage': serializeParam(
              '学生課またはシステム管理者に報告してください',
              ParamType.String,
            ),
          }.withoutNulls,
        );

        return;
      }
    });

    _model.loginIDTextController ??=
        TextEditingController(text: widget.loginId);
    _model.loginIDFocusNode ??= FocusNode();

    _model.passwordTextController ??=
        TextEditingController(text: widget.loginPassword);
    _model.passwordFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Text(
                  '出席管理システム',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'RocknRoll One',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 40.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(40.0, 67.0, 0.0, 0.0),
                  child: SizedBox(
                    width: 200.0,
                    child: TextFormField(
                      controller: _model.loginIDTextController,
                      focusNode: _model.loginIDFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'ログインID',
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'RocknRoll One',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'RocknRoll One',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.loginIDTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                indent: 46.0,
                endIndent: 46.0,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(40.0, 38.0, 0.0, 0.0),
                  child: SizedBox(
                    width: 200.0,
                    child: TextFormField(
                      controller: _model.passwordTextController,
                      focusNode: _model.passwordFocusNode,
                      autofocus: false,
                      obscureText: !_model.passwordVisibility,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'パスワード',
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'RocknRoll One',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        suffixIcon: InkWell(
                          onTap: () => safeSetState(
                            () => _model.passwordVisibility =
                                !_model.passwordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'RocknRoll One',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator: _model.passwordTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                indent: 46.0,
                endIndent: 46.0,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(1.0, 37.0, 1.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    var shouldSetState = false;
                    // ユーザーIDからデータを疲労
                    _model.searchUsersNumber = await queryUserRecordCount(
                      queryBuilder: (userRecord) => userRecord.where(
                        'userId',
                        isEqualTo: _model.loginIDTextController.text,
                      ),
                    );
                    shouldSetState = true;
                    if (_model.searchUsersNumber == 1) {
                      _model.searchUser = await queryUserRecordOnce(
                        queryBuilder: (userRecord) => userRecord
                            .where(
                              'userId',
                              isEqualTo: _model.loginIDTextController.text,
                            )
                            .where(
                              'password',
                              isEqualTo: _model.passwordTextController.text,
                            ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      shouldSetState = true;
                      if (_model.searchUser != null) {
                        _model.searchDevicesNumber = await queryUserRecordCount(
                          queryBuilder: (userRecord) => userRecord.where(
                            'deviceId',
                            isEqualTo: _model.deviceId?.deviceId,
                          ),
                        );
                        shouldSetState = true;
                        if (_model.searchDevicesNumber == 0) {
                          FFAppState().user = UserStruct(
                            userId: _model.searchUser?.userId,
                            userName: _model.searchUser?.userName,
                            deviceId: _model.deviceId,
                            isTeacher: _model.searchUser?.isTeacher,
                          );
                          FFAppState().update(() {});
                          if (FFAppState().user.isTeacher) {
                            await _model.searchUser!.reference
                                .update(createUserRecordData(
                              lastLogin: getCurrentTimestamp,
                            ));

                            context.goNamed('T001');

                            if (shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            await _model.searchUser!.reference
                                .update(createUserRecordData(
                              password: '',
                              deviceId: _model.deviceId?.deviceId,
                              firstLogin: getCurrentTimestamp,
                              lastLogin: getCurrentTimestamp,
                            ));

                            context.goNamed('S002');

                            if (shouldSetState) safeSetState(() {});
                            return;
                          }
                        }
                      } else {
                        _model.errorMessage = 'ログイン情報が異なります。';
                        _model.hideError = false;
                        safeSetState(() {});
                        if (shouldSetState) safeSetState(() {});
                        return;
                      }
                    }
                    _model.errorMessage = 'ログイン情報が異なります。';
                    _model.hideError = false;
                    safeSetState(() {});
                    if (shouldSetState) safeSetState(() {});
                  },
                  text: 'ログイン',
                  options: FFButtonOptions(
                    width: 347.0,
                    height: 74.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: FlutterFlowTheme.of(context).alternate,
                          fontSize: 32.0,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 29.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.5, 0.0, 0.0),
                        child: Icon(
                          Icons.info,
                          color: FlutterFlowTheme.of(context).error,
                          size: _model.hideError ? 0.0 : 24.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Text(
                        _model.errorMessage,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'RocknRoll One',
                              color: FlutterFlowTheme.of(context).error,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
  }
}
