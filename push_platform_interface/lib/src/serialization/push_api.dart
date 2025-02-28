// Autogenerated from Pigeon (v10.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

/// # iOS UN (UserNotification) symbols
///
/// Dart/Flutter translation of the iOS permissions API. In a future release,
/// we may replace this API with a consistent API for all platforms that require
/// permissions to show notifications to the user.
/// UNAuthorizationStatus: Constants indicating whether the app is allowed to
/// schedule notifications.
///
/// See the [Apple documentation](https://developer.apple.com/documentation/usernotifications/unnotificationsettings/1648391-authorizationstatus) for more information
enum UNAuthorizationStatus {
  notDetermined,
  denied,
  authorized,
  provisional,
  ephemeral,
}

/// The type of notification the user will see
///
/// See the [Apple documentation](https://developer.apple.com/documentation/usernotifications/unalertstyle) for more information
enum UNAlertStyle {
  none,
  banner,
  alert,
}

/// The current configuration of a notification setting
///
/// See the [Apple documentation](https://developer.apple.com/documentation/usernotifications/unnotificationsetting) for more information
enum UNNotificationSetting {
  notSupported,
  disabled,
  enabled,
}

/// Conditions to show/reveal notification content to the user
///
/// See the [Apple documentation](https://developer.apple.com/documentation/usernotifications/unshowpreviewssetting) for more information
enum UNShowPreviewsSetting {
  always,
  whenAuthenticated,
  never,
}

class RemoteMessage {
  RemoteMessage({
    this.notification,
    this.data,
  });

  Notification? notification;

  Map<String?, Object?>? data;

  Object encode() {
    return <Object?>[
      notification?.encode(),
      data,
    ];
  }

  static RemoteMessage decode(Object result) {
    result as List<Object?>;
    return RemoteMessage(
      notification: result[0] != null
          ? Notification.decode(result[0]! as List<Object?>)
          : null,
      data: (result[1] as Map<Object?, Object?>?)?.cast<String?, Object?>(),
    );
  }
}

class Notification {
  Notification({
    this.title,
    this.body,
  });

  String? title;

  String? body;

  Object encode() {
    return <Object?>[
      title,
      body,
    ];
  }

  static Notification decode(Object result) {
    result as List<Object?>;
    return Notification(
      title: result[0] as String?,
      body: result[1] as String?,
    );
  }
}

/// The object for reading notification-related settings and the authorization status of your app.
///
/// See the [Apple documentation](https://developer.apple.com/documentation/usernotifications/unnotificationsettings) for more information
class UNNotificationSettings {
  UNNotificationSettings({
    this.authorizationStatus,
    this.soundSetting,
    this.badgeSetting,
    this.alertSetting,
    this.notificationCenterSetting,
    this.lockScreenSetting,
    this.carPlaySetting,
    this.alertStyle,
    this.showPreviewsSetting,
    this.criticalAlertSetting,
    this.providesAppNotificationSettings,
    this.announcementSetting,
  });

  UNAuthorizationStatus? authorizationStatus;

  UNNotificationSetting? soundSetting;

  UNNotificationSetting? badgeSetting;

  UNNotificationSetting? alertSetting;

  UNNotificationSetting? notificationCenterSetting;

  UNNotificationSetting? lockScreenSetting;

  UNNotificationSetting? carPlaySetting;

  UNAlertStyle? alertStyle;

  UNShowPreviewsSetting? showPreviewsSetting;

  UNNotificationSetting? criticalAlertSetting;

  bool? providesAppNotificationSettings;

  UNNotificationSetting? announcementSetting;

  Object encode() {
    return <Object?>[
      authorizationStatus?.index,
      soundSetting?.index,
      badgeSetting?.index,
      alertSetting?.index,
      notificationCenterSetting?.index,
      lockScreenSetting?.index,
      carPlaySetting?.index,
      alertStyle?.index,
      showPreviewsSetting?.index,
      criticalAlertSetting?.index,
      providesAppNotificationSettings,
      announcementSetting?.index,
    ];
  }

  static UNNotificationSettings decode(Object result) {
    result as List<Object?>;
    return UNNotificationSettings(
      authorizationStatus: result[0] != null
          ? UNAuthorizationStatus.values[result[0]! as int]
          : null,
      soundSetting: result[1] != null
          ? UNNotificationSetting.values[result[1]! as int]
          : null,
      badgeSetting: result[2] != null
          ? UNNotificationSetting.values[result[2]! as int]
          : null,
      alertSetting: result[3] != null
          ? UNNotificationSetting.values[result[3]! as int]
          : null,
      notificationCenterSetting: result[4] != null
          ? UNNotificationSetting.values[result[4]! as int]
          : null,
      lockScreenSetting: result[5] != null
          ? UNNotificationSetting.values[result[5]! as int]
          : null,
      carPlaySetting: result[6] != null
          ? UNNotificationSetting.values[result[6]! as int]
          : null,
      alertStyle:
          result[7] != null ? UNAlertStyle.values[result[7]! as int] : null,
      showPreviewsSetting: result[8] != null
          ? UNShowPreviewsSetting.values[result[8]! as int]
          : null,
      criticalAlertSetting: result[9] != null
          ? UNNotificationSetting.values[result[9]! as int]
          : null,
      providesAppNotificationSettings: result[10] as bool?,
      announcementSetting: result[11] != null
          ? UNNotificationSetting.values[result[11]! as int]
          : null,
    );
  }
}

class _PushHostApiCodec extends StandardMessageCodec {
  const _PushHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is Notification) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is RemoteMessage) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is UNNotificationSettings) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return Notification.decode(readValue(buffer)!);
      case 129:
        return RemoteMessage.decode(readValue(buffer)!);
      case 130:
        return UNNotificationSettings.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class PushHostApi {
  /// Constructor for [PushHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  PushHostApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _PushHostApiCodec();

  /// Returns null if it doesn't exist.
  /// See [PushFlutterApi.onNotificationTap] to understand why a RemoteMessage is not provided here.
  Future<Map<String?, Object?>?>
      getNotificationTapWhichLaunchedTerminatedApp() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PushHostApi.getNotificationTapWhichLaunchedTerminatedApp',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as Map<Object?, Object?>?)?.cast<String?, Object?>();
    }
  }

  Future<String> getToken() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PushHostApi.getToken', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as String?)!;
    }
  }

  Future<void> backgroundFlutterApplicationReady() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PushHostApi.backgroundFlutterApplicationReady',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> onListenToOnNewToken() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PushHostApi.onListenToOnNewToken', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> onCancelToOnNewToken() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PushHostApi.onCancelToOnNewToken', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  /// Pass true for the option you want permission to use
  /// Returns true if permission was granted.
  Future<bool> requestPermission(
      bool arg_badge,
      bool arg_sound,
      bool arg_alert,
      bool arg_carPlay,
      bool arg_criticalAlert,
      bool arg_provisional,
      bool arg_providesAppNotificationSettings,
      bool arg_announcement) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PushHostApi.requestPermission', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_badge,
      arg_sound,
      arg_alert,
      arg_carPlay,
      arg_criticalAlert,
      arg_provisional,
      arg_providesAppNotificationSettings,
      arg_announcement
    ]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as bool?)!;
    }
  }

  Future<UNNotificationSettings> getNotificationSettings() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PushHostApi.getNotificationSettings', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as UNNotificationSettings?)!;
    }
  }

  Future<bool> areNotificationsEnabled() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PushHostApi.areNotificationsEnabled', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as bool?)!;
    }
  }
}

class _PushFlutterApiCodec extends StandardMessageCodec {
  const _PushFlutterApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is Notification) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is RemoteMessage) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is UNNotificationSettings) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return Notification.decode(readValue(buffer)!);
      case 129:
        return RemoteMessage.decode(readValue(buffer)!);
      case 130:
        return UNNotificationSettings.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class PushFlutterApi {
  static const MessageCodec<Object?> codec = _PushFlutterApiCodec();

  void onMessage(RemoteMessage message);

  void onBackgroundMessage(RemoteMessage message);

  /// Unfortunately, the intent provided to the app when a user taps on a
  /// notification does not include notification's title or body.
  /// In this instance, it makes more sense to remove this useful functionality from iOS too.
  /// Only the data property on the RemoteMessage is returned to the user.
  /// This is effectively the lowest common denominator API.
  ///
  /// Hint: You can still include the title, body or other metadata in your
  /// data payload to identify what notification the user tapped on.
  void onNotificationTap(Map<String?, Object?> data);

  void onNewToken(String token);

  void onOpenNotificationSettings();

  static void setup(PushFlutterApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PushFlutterApi.onMessage', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.PushFlutterApi.onMessage was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final RemoteMessage? arg_message = (args[0] as RemoteMessage?);
          assert(arg_message != null,
              'Argument for dev.flutter.pigeon.PushFlutterApi.onMessage was null, expected non-null RemoteMessage.');
          api.onMessage(arg_message!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PushFlutterApi.onBackgroundMessage', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.PushFlutterApi.onBackgroundMessage was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final RemoteMessage? arg_message = (args[0] as RemoteMessage?);
          assert(arg_message != null,
              'Argument for dev.flutter.pigeon.PushFlutterApi.onBackgroundMessage was null, expected non-null RemoteMessage.');
          api.onBackgroundMessage(arg_message!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PushFlutterApi.onNotificationTap', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.PushFlutterApi.onNotificationTap was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final Map<String?, Object?>? arg_data =
              (args[0] as Map<Object?, Object?>?)?.cast<String?, Object?>();
          assert(arg_data != null,
              'Argument for dev.flutter.pigeon.PushFlutterApi.onNotificationTap was null, expected non-null Map<String?, Object?>.');
          api.onNotificationTap(arg_data!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PushFlutterApi.onNewToken', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.PushFlutterApi.onNewToken was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final String? arg_token = (args[0] as String?);
          assert(arg_token != null,
              'Argument for dev.flutter.pigeon.PushFlutterApi.onNewToken was null, expected non-null String.');
          api.onNewToken(arg_token!);
          return;
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.PushFlutterApi.onOpenNotificationSettings', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          // ignore message
          api.onOpenNotificationSettings();
          return;
        });
      }
    }
  }
}
