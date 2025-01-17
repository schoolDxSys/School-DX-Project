import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendRecord extends FirestoreRecord {
  AttendRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "serial" field.
  String? _serial;
  String get serial => _serial ?? '';
  bool hasSerial() => _serial != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _serial = snapshotData['serial'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attend');

  static Stream<AttendRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendRecord.fromSnapshot(s));

  static Future<AttendRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendRecord.fromSnapshot(s));

  static AttendRecord fromSnapshot(DocumentSnapshot snapshot) => AttendRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendRecordData({
  String? userId,
  String? serial,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'serial': serial,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendRecordDocumentEquality implements Equality<AttendRecord> {
  const AttendRecordDocumentEquality();

  @override
  bool equals(AttendRecord? e1, AttendRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.serial == e2?.serial &&
        e1?.date == e2?.date;
  }

  @override
  int hash(AttendRecord? e) =>
      const ListEquality().hash([e?.userId, e?.serial, e?.date]);

  @override
  bool isValidKey(Object? o) => o is AttendRecord;
}
