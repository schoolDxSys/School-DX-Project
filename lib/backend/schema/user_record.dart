import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "firstLogin" field.
  DateTime? _firstLogin;
  DateTime? get firstLogin => _firstLogin;
  bool hasFirstLogin() => _firstLogin != null;

  // "lastLogin" field.
  DateTime? _lastLogin;
  DateTime? get lastLogin => _lastLogin;
  bool hasLastLogin() => _lastLogin != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "isTeacher" field.
  bool? _isTeacher;
  bool get isTeacher => _isTeacher ?? false;
  bool hasIsTeacher() => _isTeacher != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _userName = snapshotData['userName'] as String?;
    _firstLogin = snapshotData['firstLogin'] as DateTime?;
    _lastLogin = snapshotData['lastLogin'] as DateTime?;
    _deviceId = snapshotData['deviceId'] as String?;
    _password = snapshotData['password'] as String?;
    _isTeacher = snapshotData['isTeacher'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? userId,
  String? userName,
  DateTime? firstLogin,
  DateTime? lastLogin,
  String? deviceId,
  String? password,
  bool? isTeacher,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'firstLogin': firstLogin,
      'lastLogin': lastLogin,
      'deviceId': deviceId,
      'password': password,
      'isTeacher': isTeacher,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.userName == e2?.userName &&
        e1?.firstLogin == e2?.firstLogin &&
        e1?.lastLogin == e2?.lastLogin &&
        e1?.deviceId == e2?.deviceId &&
        e1?.password == e2?.password &&
        e1?.isTeacher == e2?.isTeacher;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.userName,
        e?.firstLogin,
        e?.lastLogin,
        e?.deviceId,
        e?.password,
        e?.isTeacher
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
