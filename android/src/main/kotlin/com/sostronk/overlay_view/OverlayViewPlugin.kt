package com.sostronk.overlay_view

import OverlayManager
import OverlayView
import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

/** OverlayViewPlugin */
class OverlayViewPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
    private lateinit var context: Context
    private lateinit var engineGroup: FlutterEngineGroup

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "overlay_view")
    channel.setMethodCallHandler(this)
      context = flutterPluginBinding.applicationContext
      engineGroup = FlutterEngineGroup(context)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "createAndCacheEngine") {
        val engineId = call.argument<String>("id")!!
        val entryPoint = call.argument<String>("entryPoint")!!
        val overlayEntryPoint = DartExecutor.DartEntrypoint(
            FlutterInjector.instance().flutterLoader().findAppBundlePath(),
            entryPoint
        )
        val overlayEngine = engineGroup.createAndRunEngine(context, overlayEntryPoint)
        FlutterEngineCache.getInstance()
            .put(engineId, overlayEngine)
      result.success(true)
    } else if(call.method == "createView") {
        val engineId = call.argument<String>("id")!!
        val view = FlutterOverlayView(context,engineId)
        OverlayManager.setOverlay(engineId,view)
        result.success(true)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

    inner class FlutterOverlayView(context: Context,engineId: String) : OverlayView(context,engineId) {

    }
}
