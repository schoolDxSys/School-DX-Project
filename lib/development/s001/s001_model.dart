import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 's001_widget.dart' show S001Widget;
import 'package:flutter/material.dart';

class S001Model extends FlutterFlowModel<S001Widget> {
  ///  Local state fields for this page.

  String errorMessage = ' ';

  bool hideError = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getDeviceId] action in S001 widget.
  DeviceIdStruct? deviceId;
  // Stores action output result for [Firestore Query - Query a collection] action in S001 widget.
  List<UserRecord>? searchUserWithDevice;
  // State field(s) for loginID widget.
  FocusNode? loginIDFocusNode;
  TextEditingController? loginIDTextController;
  String? Function(BuildContext, String?)? loginIDTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? searchUsersNumber;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserRecord? searchUser;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? searchDevicesNumber;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    loginIDFocusNode?.dispose();
    loginIDTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
