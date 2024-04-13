import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'overlay_view_method_channel.dart';

abstract class OverlayViewPlatform extends PlatformInterface {
  /// Constructs a OverlayViewPlatform.
  OverlayViewPlatform() : super(token: _token);

  static final Object _token = Object();

  static OverlayViewPlatform _instance = MethodChannelOverlayView();

  /// The default instance of [OverlayViewPlatform] to use.
  ///
  /// Defaults to [MethodChannelOverlayView].
  static OverlayViewPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OverlayViewPlatform] when
  /// they register themselves.
  static set instance(OverlayViewPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> createAndCacheEngine(String engineId, String entryPoint) {
    throw UnimplementedError(
        'createAndCacheEngine(engineId,entryPoint) has not been implemented.');
  }

  Future<bool?> createView(String engineId) {
    throw UnimplementedError('createView(engineId) has not been implemented.');
  }
}
