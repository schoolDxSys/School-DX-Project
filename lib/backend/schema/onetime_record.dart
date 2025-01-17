import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnetimeRecord extends FirestoreRecord {
  OnetimeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "serial" field.
  String? _serial;
  String get serial => _serial ?? '';
  bool hasSerial() => _serial != null;

  // "qrSerial" field.
  String? _qrSerial;
  String get qrSerial => _qrSerial ?? '';
  bool hasQrSerial() => _qrSerial != null;

  void _initializeFields() {
    _serial = snapshotData['serial'] as String?;
    _qrSerial = snapshotData['qrSerial'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('onetime');

  static Stream<OnetimeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OnetimeRecord.fromSnapshot(s));

  static Future<OnetimeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OnetimeRecord.fromSnapshot(s));

  static OnetimeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OnetimeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OnetimeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OnetimeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OnetimeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OnetimeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOnetimeRecordData({
  String? serial,
  String? qrSerial,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'serial': serial,
      'qrSerial': qrSerial,
    }.withoutNulls,
  );

  return firestoreData;
}

class OnetimeRecordDocumentEquality implements Equality<OnetimeRecord> {
  const OnetimeRecordDocumentEquality();

  @override
  bool equals(OnetimeRecord? e1, OnetimeRecord? e2) {
    return e1?.serial == e2?.serial && e1?.qrSerial == e2?.qrSerial;
  }

  @override
  int hash(OnetimeRecord? e) =>
      const ListEquality().hash([e?.serial, e?.qrSerial]);

  @override
  bool isValidKey(Object? o) => o is OnetimeRecord;
}
