import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 't003_widget.dart' show T003Widget;
import 'package:flutter/material.dart';

class T003Model extends FlutterFlowModel<T003Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in T003 widget.
  List<SubjectListRecord>? subjects;
  // Stores action output result for [Firestore Query - Query a collection] action in T003 widget.
  SubjectTimeRecord? subjectTimes;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Custom Action - createUuid] action in Button widget.
  String? uuid;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SubjectRecord? nowSubjectDate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
