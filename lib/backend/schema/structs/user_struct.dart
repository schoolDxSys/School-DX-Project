// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? userId,
    String? userName,
    DeviceIdStruct? deviceId,
    bool? isTeacher,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _userName = userName,
        _deviceId = deviceId,
        _isTeacher = isTeacher,
        super(firestoreUtilData);

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "deviceId" field.
  DeviceIdStruct? _deviceId;
  DeviceIdStruct get deviceId => _deviceId ?? DeviceIdStruct();
  set deviceId(DeviceIdStruct? val) => _deviceId = val;

  void updateDeviceId(Function(DeviceIdStruct) updateFn) {
    updateFn(_deviceId ??= DeviceIdStruct());
  }

  bool hasDeviceId() => _deviceId != null;

  // "isTeacher" field.
  bool? _isTeacher;
  bool get isTeacher => _isTeacher ?? false;
  set isTeacher(bool? val) => _isTeacher = val;

  bool hasIsTeacher() => _isTeacher != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        userId: data['userId'] as String?,
        userName: data['userName'] as String?,
        deviceId: data['deviceId'] is DeviceIdStruct
            ? data['deviceId']
            : DeviceIdStruct.maybeFromMap(data['deviceId']),
        isTeacher: data['isTeacher'] as bool?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'userId': _userId,
        'userName': _userName,
        'deviceId': _deviceId?.toMap(),
        'isTeacher': _isTeacher,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'deviceId': serializeParam(
          _deviceId,
          ParamType.DataStruct,
        ),
        'isTeacher': serializeParam(
          _isTeacher,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        deviceId: deserializeStructParam(
          data['deviceId'],
          ParamType.DataStruct,
          false,
          structBuilder: DeviceIdStruct.fromSerializableMap,
        ),
        isTeacher: deserializeParam(
          data['isTeacher'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        userId == other.userId &&
        userName == other.userName &&
        deviceId == other.deviceId &&
        isTeacher == other.isTeacher;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userId, userName, deviceId, isTeacher]);
}

UserStruct createUserStruct({
  String? userId,
  String? userName,
  DeviceIdStruct? deviceId,
  bool? isTeacher,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      userId: userId,
      userName: userName,
      deviceId: deviceId ?? (clearUnsetFields ? DeviceIdStruct() : null),
      isTeacher: isTeacher,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Handle nested data for "deviceId" field.
  addDeviceIdStructData(
    firestoreData,
    user.hasDeviceId() ? user.deviceId : null,
    'deviceId',
    forFieldValue,
  );

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
