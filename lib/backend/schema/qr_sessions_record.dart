import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QrSessionsRecord extends FirestoreRecord {
  QrSessionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "qrId" field.
  String? _qrId;
  String get qrId => _qrId ?? '';
  bool hasQrId() => _qrId != null;

  // "courseId" field.
  DocumentReference? _courseId;
  DocumentReference? get courseId => _courseId;
  bool hasCourseId() => _courseId != null;

  void _initializeFields() {
    _qrId = snapshotData['qrId'] as String?;
    _courseId = snapshotData['courseId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('qr-sessions');

  static Stream<QrSessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QrSessionsRecord.fromSnapshot(s));

  static Future<QrSessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QrSessionsRecord.fromSnapshot(s));

  static QrSessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QrSessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QrSessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QrSessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QrSessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QrSessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQrSessionsRecordData({
  String? qrId,
  DocumentReference? courseId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'qrId': qrId,
      'courseId': courseId,
    }.withoutNulls,
  );

  return firestoreData;
}

class QrSessionsRecordDocumentEquality implements Equality<QrSessionsRecord> {
  const QrSessionsRecordDocumentEquality();

  @override
  bool equals(QrSessionsRecord? e1, QrSessionsRecord? e2) {
    return e1?.qrId == e2?.qrId && e1?.courseId == e2?.courseId;
  }

  @override
  int hash(QrSessionsRecord? e) =>
      const ListEquality().hash([e?.qrId, e?.courseId]);

  @override
  bool isValidKey(Object? o) => o is QrSessionsRecord;
}
