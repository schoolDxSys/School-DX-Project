import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentsRecord extends FirestoreRecord {
  StudentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "studentId" field.
  int? _studentId;
  int get studentId => _studentId ?? 0;
  bool hasStudentId() => _studentId != null;

  // "studentName" field.
  String? _studentName;
  String get studentName => _studentName ?? '';
  bool hasStudentName() => _studentName != null;

  // "loginId" field.
  String? _loginId;
  String get loginId => _loginId ?? '';
  bool hasLoginId() => _loginId != null;

  // "firstLogin" field.
  DateTime? _firstLogin;
  DateTime? get firstLogin => _firstLogin;
  bool hasFirstLogin() => _firstLogin != null;

  // "lastLogin" field.
  DateTime? _lastLogin;
  DateTime? get lastLogin => _lastLogin;
  bool hasLastLogin() => _lastLogin != null;

  void _initializeFields() {
    _studentId = castToType<int>(snapshotData['studentId']);
    _studentName = snapshotData['studentName'] as String?;
    _loginId = snapshotData['loginId'] as String?;
    _firstLogin = snapshotData['firstLogin'] as DateTime?;
    _lastLogin = snapshotData['lastLogin'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('students');

  static Stream<StudentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentsRecord.fromSnapshot(s));

  static Future<StudentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentsRecord.fromSnapshot(s));

  static StudentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentsRecordData({
  int? studentId,
  String? studentName,
  String? loginId,
  DateTime? firstLogin,
  DateTime? lastLogin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'studentId': studentId,
      'studentName': studentName,
      'loginId': loginId,
      'firstLogin': firstLogin,
      'lastLogin': lastLogin,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudentsRecordDocumentEquality implements Equality<StudentsRecord> {
  const StudentsRecordDocumentEquality();

  @override
  bool equals(StudentsRecord? e1, StudentsRecord? e2) {
    return e1?.studentId == e2?.studentId &&
        e1?.studentName == e2?.studentName &&
        e1?.loginId == e2?.loginId &&
        e1?.firstLogin == e2?.firstLogin &&
        e1?.lastLogin == e2?.lastLogin;
  }

  @override
  int hash(StudentsRecord? e) => const ListEquality().hash(
      [e?.studentId, e?.studentName, e?.loginId, e?.firstLogin, e?.lastLogin]);

  @override
  bool isValidKey(Object? o) => o is StudentsRecord;
}
