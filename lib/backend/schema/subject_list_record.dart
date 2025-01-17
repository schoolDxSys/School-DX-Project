import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubjectListRecord extends FirestoreRecord {
  SubjectListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "subjectName" field.
  String? _subjectName;
  String get subjectName => _subjectName ?? '';
  bool hasSubjectName() => _subjectName != null;

  // "collageName" field.
  String? _collageName;
  String get collageName => _collageName ?? '';
  bool hasCollageName() => _collageName != null;

  void _initializeFields() {
    _subjectName = snapshotData['subjectName'] as String?;
    _collageName = snapshotData['collageName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subjectList');

  static Stream<SubjectListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubjectListRecord.fromSnapshot(s));

  static Future<SubjectListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubjectListRecord.fromSnapshot(s));

  static SubjectListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubjectListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubjectListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubjectListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubjectListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubjectListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubjectListRecordData({
  String? subjectName,
  String? collageName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subjectName': subjectName,
      'collageName': collageName,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubjectListRecordDocumentEquality implements Equality<SubjectListRecord> {
  const SubjectListRecordDocumentEquality();

  @override
  bool equals(SubjectListRecord? e1, SubjectListRecord? e2) {
    return e1?.subjectName == e2?.subjectName &&
        e1?.collageName == e2?.collageName;
  }

  @override
  int hash(SubjectListRecord? e) =>
      const ListEquality().hash([e?.subjectName, e?.collageName]);

  @override
  bool isValidKey(Object? o) => o is SubjectListRecord;
}
