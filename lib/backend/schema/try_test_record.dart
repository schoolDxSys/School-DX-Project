import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TryTestRecord extends FirestoreRecord {
  TryTestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "isMan" field.
  bool? _isMan;
  bool get isMan => _isMan ?? false;
  bool hasIsMan() => _isMan != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _isMan = snapshotData['isMan'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('try-test');

  static Stream<TryTestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TryTestRecord.fromSnapshot(s));

  static Future<TryTestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TryTestRecord.fromSnapshot(s));

  static TryTestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TryTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TryTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TryTestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TryTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TryTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTryTestRecordData({
  String? name,
  int? age,
  bool? isMan,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'age': age,
      'isMan': isMan,
    }.withoutNulls,
  );

  return firestoreData;
}

class TryTestRecordDocumentEquality implements Equality<TryTestRecord> {
  const TryTestRecordDocumentEquality();

  @override
  bool equals(TryTestRecord? e1, TryTestRecord? e2) {
    return e1?.name == e2?.name && e1?.age == e2?.age && e1?.isMan == e2?.isMan;
  }

  @override
  int hash(TryTestRecord? e) =>
      const ListEquality().hash([e?.name, e?.age, e?.isMan]);

  @override
  bool isValidKey(Object? o) => o is TryTestRecord;
}
