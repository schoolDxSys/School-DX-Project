import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubjectsRecord extends FirestoreRecord {
  SubjectsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "subjectId" field.
  int? _subjectId;
  int get subjectId => _subjectId ?? 0;
  bool hasSubjectId() => _subjectId != null;

  // "subjectName" field.
  String? _subjectName;
  String get subjectName => _subjectName ?? '';
  bool hasSubjectName() => _subjectName != null;

  void _initializeFields() {
    _subjectId = castToType<int>(snapshotData['subjectId']);
    _subjectName = snapshotData['subjectName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subjects');

  static Stream<SubjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubjectsRecord.fromSnapshot(s));

  static Future<SubjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubjectsRecord.fromSnapshot(s));

  static SubjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubjectsRecordData({
  int? subjectId,
  String? subjectName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subjectId': subjectId,
      'subjectName': subjectName,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubjectsRecordDocumentEquality implements Equality<SubjectsRecord> {
  const SubjectsRecordDocumentEquality();

  @override
  bool equals(SubjectsRecord? e1, SubjectsRecord? e2) {
    return e1?.subjectId == e2?.subjectId && e1?.subjectName == e2?.subjectName;
  }

  @override
  int hash(SubjectsRecord? e) =>
      const ListEquality().hash([e?.subjectId, e?.subjectName]);

  @override
  bool isValidKey(Object? o) => o is SubjectsRecord;
}
