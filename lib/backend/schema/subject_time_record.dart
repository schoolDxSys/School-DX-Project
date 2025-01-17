import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubjectTimeRecord extends FirestoreRecord {
  SubjectTimeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "subjectTime" field.
  List<String>? _subjectTime;
  List<String> get subjectTime => _subjectTime ?? const [];
  bool hasSubjectTime() => _subjectTime != null;

  void _initializeFields() {
    _subjectTime = getDataList(snapshotData['subjectTime']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subjectTime');

  static Stream<SubjectTimeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubjectTimeRecord.fromSnapshot(s));

  static Future<SubjectTimeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubjectTimeRecord.fromSnapshot(s));

  static SubjectTimeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubjectTimeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubjectTimeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubjectTimeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubjectTimeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubjectTimeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubjectTimeRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SubjectTimeRecordDocumentEquality implements Equality<SubjectTimeRecord> {
  const SubjectTimeRecordDocumentEquality();

  @override
  bool equals(SubjectTimeRecord? e1, SubjectTimeRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.subjectTime, e2?.subjectTime);
  }

  @override
  int hash(SubjectTimeRecord? e) => const ListEquality().hash([e?.subjectTime]);

  @override
  bool isValidKey(Object? o) => o is SubjectTimeRecord;
}
