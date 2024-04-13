// Autogenerated by jnigen. DO NOT EDIT!

// ignore_for_file: annotate_overrides
// ignore_for_file: camel_case_extensions
// ignore_for_file: camel_case_types
// ignore_for_file: constant_identifier_names
// ignore_for_file: doc_directive_unknown
// ignore_for_file: file_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: overridden_fields
// ignore_for_file: unnecessary_cast
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import "dart:isolate" show ReceivePort;
import "dart:ffi" as ffi;
import "package:jni/internal_helpers_for_jnigen.dart";
import "package:jni/jni.dart" as jni;

// Auto-generated initialization code.

final ffi.Pointer<T> Function<T extends ffi.NativeType>(String sym) jniLookup =
    ProtectedJniExtensions.initGeneratedLibrary("overlay_view");

/// from: OverlayInterface
class OverlayInterface extends jni.JObject {
  @override
  late final jni.JObjType<OverlayInterface> $type = type;

  OverlayInterface.fromReference(
    super.reference,
  ) : super.fromReference();

  /// The type which includes information such as the signature of this class.
  static const type = $OverlayInterfaceType();
  static final _addView = jniLookup<
              ffi
              .NativeFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>)>>(
          "OverlayInterface__addView")
      .asFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>)>();

  /// from: public abstract void addView()
  void addView() {
    _addView(reference.pointer).check();
  }

  static final _removeView = jniLookup<
              ffi
              .NativeFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>)>>(
          "OverlayInterface__removeView")
      .asFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>)>();

  /// from: public abstract void removeView()
  void removeView() {
    _removeView(reference.pointer).check();
  }

  static final _show0 = jniLookup<
              ffi
              .NativeFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>)>>(
          "OverlayInterface__show0")
      .asFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>)>();

  /// from: public abstract void show()
  void show0() {
    _show0(reference.pointer).check();
  }

  static final _hide0 = jniLookup<
              ffi
              .NativeFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>)>>(
          "OverlayInterface__hide0")
      .asFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>)>();

  /// from: public abstract void hide()
  void hide0() {
    _hide0(reference.pointer).check();
  }

  static final _getLayoutParams = jniLookup<
              ffi
              .NativeFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>)>>(
          "OverlayInterface__getLayoutParams")
      .asFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>)>();

  /// from: public abstract android.view.WindowManager$LayoutParams getLayoutParams()
  /// The returned object must be released after use, by calling the [release] method.
  jni.JObject getLayoutParams() {
    return _getLayoutParams(reference.pointer).object(const jni.JObjectType());
  }

  static final _updateLayoutParams = jniLookup<
              ffi.NativeFunction<
                  jni.JniResult Function(
                      ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(
          "OverlayInterface__updateLayoutParams")
      .asFunction<
          jni.JniResult Function(
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public abstract void updateLayoutParams(android.view.WindowManager$LayoutParams layoutParams)
  void updateLayoutParams(
    jni.JObject layoutParams,
  ) {
    _updateLayoutParams(reference.pointer, layoutParams.reference.pointer)
        .check();
  }

  static final _reportSize = jniLookup<
          ffi.NativeFunction<
              jni.JniResult Function(ffi.Pointer<ffi.Void>, ffi.Int32,
                  ffi.Int32)>>("OverlayInterface__reportSize")
      .asFunction<jni.JniResult Function(ffi.Pointer<ffi.Void>, int, int)>();

  /// from: public abstract void reportSize(int i, int i1)
  void reportSize(
    int i,
    int i1,
  ) {
    _reportSize(reference.pointer, i, i1).check();
  }
}

final class $OverlayInterfaceType extends jni.JObjType<OverlayInterface> {
  const $OverlayInterfaceType();

  @override
  String get signature => r"LOverlayInterface;";

  @override
  OverlayInterface fromReference(jni.JReference reference) =>
      OverlayInterface.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($OverlayInterfaceType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($OverlayInterfaceType) &&
        other is $OverlayInterfaceType;
  }
}

/// from: OverlayManager
class OverlayManager extends jni.JObject {
  @override
  late final jni.JObjType<OverlayManager> $type = type;

  OverlayManager.fromReference(
    super.reference,
  ) : super.fromReference();

  /// The type which includes information such as the signature of this class.
  static const type = $OverlayManagerType();
  static final _get_INSTANCE =
      jniLookup<ffi.NativeFunction<jni.JniResult Function()>>(
              "get_OverlayManager__INSTANCE")
          .asFunction<jni.JniResult Function()>();

  /// from: static public final OverlayManager INSTANCE
  /// The returned object must be released after use, by calling the [release] method.
  static OverlayManager get INSTANCE =>
      _get_INSTANCE().object(const $OverlayManagerType());

  static final _getOverlay = jniLookup<
          ffi.NativeFunction<
              jni.JniResult Function(ffi.Pointer<ffi.Void>,
                  ffi.Pointer<ffi.Void>)>>("OverlayManager__getOverlay")
      .asFunction<
          jni.JniResult Function(
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public final OverlayInterface getOverlay(java.lang.String string)
  /// The returned object must be released after use, by calling the [release] method.
  OverlayInterface getOverlay(
    jni.JString string,
  ) {
    return _getOverlay(reference.pointer, string.reference.pointer)
        .object(const $OverlayInterfaceType());
  }

  static final _hasOverlay = jniLookup<
          ffi.NativeFunction<
              jni.JniResult Function(ffi.Pointer<ffi.Void>,
                  ffi.Pointer<ffi.Void>)>>("OverlayManager__hasOverlay")
      .asFunction<
          jni.JniResult Function(
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  /// from: public final boolean hasOverlay(java.lang.String string)
  bool hasOverlay(
    jni.JString string,
  ) {
    return _hasOverlay(reference.pointer, string.reference.pointer).boolean;
  }

  static final _setOverlay = jniLookup<
          ffi.NativeFunction<
              jni.JniResult Function(
                  ffi.Pointer<ffi.Void>,
                  ffi.Pointer<ffi.Void>,
                  ffi.Pointer<ffi.Void>)>>("OverlayManager__setOverlay")
      .asFunction<
          jni.JniResult Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>,
              ffi.Pointer<ffi.Void>)>();

  /// from: public final void setOverlay(java.lang.String string, OverlayInterface overlayInterface)
  void setOverlay(
    jni.JString string,
    OverlayInterface overlayInterface,
  ) {
    _setOverlay(reference.pointer, string.reference.pointer,
            overlayInterface.reference.pointer)
        .check();
  }
}

final class $OverlayManagerType extends jni.JObjType<OverlayManager> {
  const $OverlayManagerType();

  @override
  String get signature => r"LOverlayManager;";

  @override
  OverlayManager fromReference(jni.JReference reference) =>
      OverlayManager.fromReference(reference);

  @override
  jni.JObjType get superType => const jni.JObjectType();

  @override
  final superCount = 1;

  @override
  int get hashCode => ($OverlayManagerType).hashCode;

  @override
  bool operator ==(Object other) {
    return other.runtimeType == ($OverlayManagerType) &&
        other is $OverlayManagerType;
  }
}
