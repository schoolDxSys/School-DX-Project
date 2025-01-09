import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendancesRecord extends FirestoreRecord {
  AttendancesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "studentId" field.
  DocumentReference? _studentId;
  DocumentReference? get studentId => _studentId;
  bool hasStudentId() => _studentId != null;

  // "subjectId" field.
  DocumentReference? _subjectId;
  DocumentReference? get subjectId => _subjectId;
  bool hasSubjectId() => _subjectId != null;

  void _initializeFields() {
    _studentId = snapshotData['studentId'] as DocumentReference?;
    _subjectId = snapshotData['subjectId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendances');

  static Stream<AttendancesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendancesRecord.fromSnapshot(s));

  static Future<AttendancesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendancesRecord.fromSnapshot(s));

  static AttendancesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendancesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendancesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendancesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendancesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendancesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendancesRecordData({
  DocumentReference? studentId,
  DocumentReference? subjectId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'studentId': studentId,
      'subjectId': subjectId,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendancesRecordDocumentEquality implements Equality<AttendancesRecord> {
  const AttendancesRecordDocumentEquality();

  @override
  bool equals(AttendancesRecord? e1, AttendancesRecord? e2) {
    return e1?.studentId == e2?.studentId && e1?.subjectId == e2?.subjectId;
  }

  @override
  int hash(AttendancesRecord? e) =>
      const ListEquality().hash([e?.studentId, e?.subjectId]);

  @override
  bool isValidKey(Object? o) => o is AttendancesRecord;
}
