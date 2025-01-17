import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubjectRecord extends FirestoreRecord {
  SubjectRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "subjectName" field.
  String? _subjectName;
  String get subjectName => _subjectName ?? '';
  bool hasSubjectName() => _subjectName != null;

  // "serial" field.
  String? _serial;
  String get serial => _serial ?? '';
  bool hasSerial() => _serial != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "subjectDate" field.
  String? _subjectDate;
  String get subjectDate => _subjectDate ?? '';
  bool hasSubjectDate() => _subjectDate != null;

  void _initializeFields() {
    _subjectName = snapshotData['subjectName'] as String?;
    _serial = snapshotData['serial'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _subjectDate = snapshotData['subjectDate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subject');

  static Stream<SubjectRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubjectRecord.fromSnapshot(s));

  static Future<SubjectRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubjectRecord.fromSnapshot(s));

  static SubjectRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubjectRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubjectRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubjectRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubjectRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubjectRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubjectRecordData({
  String? subjectName,
  String? serial,
  DateTime? date,
  String? subjectDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subjectName': subjectName,
      'serial': serial,
      'date': date,
      'subjectDate': subjectDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubjectRecordDocumentEquality implements Equality<SubjectRecord> {
  const SubjectRecordDocumentEquality();

  @override
  bool equals(SubjectRecord? e1, SubjectRecord? e2) {
    return e1?.subjectName == e2?.subjectName &&
        e1?.serial == e2?.serial &&
        e1?.date == e2?.date &&
        e1?.subjectDate == e2?.subjectDate;
  }

  @override
  int hash(SubjectRecord? e) => const ListEquality()
      .hash([e?.subjectName, e?.serial, e?.date, e?.subjectDate]);

  @override
  bool isValidKey(Object? o) => o is SubjectRecord;
}
