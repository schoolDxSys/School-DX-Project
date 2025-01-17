// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// 公開パッケージをインポート
// 参考
// https://pub.dev/packages/device_info_plus
// デバイス情報を取得できるようになる
import 'package:device_info_plus/device_info_plus.dart';
// 参考
// https://pub.dev/packages/crypto
// ハッシュ化できるようになる
import 'package:crypto/crypto.dart';
// 文字列をバイトに変換できるようになる
import 'dart:convert';

Future<DeviceIdStruct?> getDeviceId() async {
  // インスタンス初期化
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  DeviceIdStruct? result = null;

  // OSを判定
  if (isAndroid) {
    // androidの情報を同期的に取得
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    // ハッシュ化
    var hashSource =
        utf8.encode("${androidInfo.model}${androidInfo.serialNumber}");

    // result変数にインスタンス生成
    result = DeviceIdStruct(
        uuid: androidInfo.serialNumber,
        vender: androidInfo.model,
        deviceId: sha512.convert(hashSource).toString());
  } else if (isiOS) {
    // iosの情報を同期的に取得
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

    // ID情報が取得できない恐れがあるため
    if (iosInfo.identifierForVendor is String) {
      // ハッシュ化
      var hashSource = utf8
          .encode("${iosInfo.utsname.machine}${iosInfo.identifierForVendor}");

      // result変数にインスタンス生成
      result = DeviceIdStruct(
          uuid: iosInfo.identifierForVendor,
          vender: iosInfo.utsname.machine,
          deviceId: sha512.convert(hashSource).toString());
    }
  }

  // deviceのIDを返す
  return Future<DeviceIdStruct?>.value(result);
}
