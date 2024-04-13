import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'overlay_view_platform_interface.dart';

/// An implementation of [OverlayViewPlatform] that uses method channels.
class MethodChannelOverlayView extends OverlayViewPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('overlay_view');

  @override
  Future<bool?> createAndCacheEngine(String engineId, String entryPoint) async {
    final status =
        await methodChannel.invokeMethod<bool>('createAndCacheEngine', {
      'id': engineId,
      'entryPoint': entryPoint,
    });
    return status;
  }

  @override
  Future<bool?> createView(String engineId) async {
    final status = await methodChannel.invokeMethod<bool>('createView', {
      'id': engineId,
    });
    return status;
  }
}
