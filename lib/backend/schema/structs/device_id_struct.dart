// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DeviceIdStruct extends FFFirebaseStruct {
  DeviceIdStruct({
    String? uuid,
    String? vender,
    String? deviceId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uuid = uuid,
        _vender = vender,
        _deviceId = deviceId,
        super(firestoreUtilData);

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;

  bool hasUuid() => _uuid != null;

  // "vender" field.
  String? _vender;
  String get vender => _vender ?? '';
  set vender(String? val) => _vender = val;

  bool hasVender() => _vender != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  set deviceId(String? val) => _deviceId = val;

  bool hasDeviceId() => _deviceId != null;

  static DeviceIdStruct fromMap(Map<String, dynamic> data) => DeviceIdStruct(
        uuid: data['uuid'] as String?,
        vender: data['vender'] as String?,
        deviceId: data['deviceId'] as String?,
      );

  static DeviceIdStruct? maybeFromMap(dynamic data) =>
      data is Map ? DeviceIdStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'uuid': _uuid,
        'vender': _vender,
        'deviceId': _deviceId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'vender': serializeParam(
          _vender,
          ParamType.String,
        ),
        'deviceId': serializeParam(
          _deviceId,
          ParamType.String,
        ),
      }.withoutNulls;

  static DeviceIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceIdStruct(
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        vender: deserializeParam(
          data['vender'],
          ParamType.String,
          false,
        ),
        deviceId: deserializeParam(
          data['deviceId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DeviceIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeviceIdStruct &&
        uuid == other.uuid &&
        vender == other.vender &&
        deviceId == other.deviceId;
  }

  @override
  int get hashCode => const ListEquality().hash([uuid, vender, deviceId]);
}

DeviceIdStruct createDeviceIdStruct({
  String? uuid,
  String? vender,
  String? deviceId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeviceIdStruct(
      uuid: uuid,
      vender: vender,
      deviceId: deviceId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeviceIdStruct? updateDeviceIdStruct(
  DeviceIdStruct? deviceIdStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    deviceIdStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeviceIdStructData(
  Map<String, dynamic> firestoreData,
  DeviceIdStruct? deviceIdStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (deviceIdStruct == null) {
    return;
  }
  if (deviceIdStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && deviceIdStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deviceIdStructData =
      getDeviceIdFirestoreData(deviceIdStruct, forFieldValue);
  final nestedData =
      deviceIdStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = deviceIdStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeviceIdFirestoreData(
  DeviceIdStruct? deviceIdStruct, [
  bool forFieldValue = false,
]) {
  if (deviceIdStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(deviceIdStruct.toMap());

  // Add any Firestore field values
  deviceIdStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeviceIdListFirestoreData(
  List<DeviceIdStruct>? deviceIdStructs,
) =>
    deviceIdStructs?.map((e) => getDeviceIdFirestoreData(e, true)).toList() ??
    [];
