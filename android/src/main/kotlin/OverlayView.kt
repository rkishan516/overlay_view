import android.content.Context
import android.graphics.PixelFormat
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import io.flutter.embedding.android.FlutterTextureView
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import kotlin.coroutines.resume
import kotlin.coroutines.suspendCoroutine
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking

abstract class OverlayView(context: Context, cachedEngineKey: String) : OverlayInterface {
    private var flutterView: FlutterView?
    private val flutterEngine: FlutterEngine?
    private var windowManager: WindowManager
    private var uiHandler: Handler
    private var addedToWindow = false
    private var layoutParams: WindowManager.LayoutParams
    var showing = false

    companion object {
        const val TAG: String = "OVERLAY_VIEW"
    }

    init {
        windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        layoutParams = WindowManager.LayoutParams(
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.WRAP_CONTENT,
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.TOP or Gravity.START
            y = 50
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                layoutInDisplayCutoutMode =
                    WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
            }
        }
        this.uiHandler = Handler(Looper.getMainLooper())
        flutterEngine = FlutterEngineCache.getInstance().get(cachedEngineKey)
        val flutterSurfaceView = FlutterTextureView(context)
        flutterView = FlutterView(context, flutterSurfaceView)
    }
    open override fun addView() {
        if (addedToWindow) {
            Log.i(TAG, "View already added from window")
            return
        }
        if (flutterEngine == null) {
            Log.i(TAG, "Flutter engine not found")
            return
        }
        try {
            uiHandler.post {
                flutterView!!.attachToFlutterEngine(flutterEngine)
                flutterEngine.lifecycleChannel.appIsResumed()
                windowManager.addView(flutterView, layoutParams)
                addedToWindow = true
            }
        } catch (e: Exception) {
            Log.e(TAG,"Error adding overlay view",e)
        }
        addedToWindow = true
    }

    open override fun removeView() {
        if (!addedToWindow) {
            Log.i(TAG, "View already removed from window")
            return
        }
        if (flutterEngine == null) {
            Log.i(TAG, "Flutter engine not found")
            return
        }
        try {
            uiHandler.post {
                flutterEngine.lifecycleChannel.appIsResumed()
                flutterView!!.detachFromFlutterEngine()
                windowManager.removeView(flutterView)
                addedToWindow = false
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error remove overlay view")
        }
        addedToWindow = false
    }

    open override fun show() {
        uiHandler.post {
            Log.i(TAG, "Showing view")
            flutterView?.visibility = View.VISIBLE
            showing = true
        }
    }

    open override fun hide() {
        uiHandler.post {
            Log.i(TAG, "Hiding view")
            flutterView?.visibility = View.GONE
            showing = false
        }
    }

    open override fun getLayoutParams(): WindowManager.LayoutParams {
        return layoutParams
    }

    open override fun updateLayoutParams(layoutParams: WindowManager.LayoutParams) {
        this.layoutParams = layoutParams
        runBlocking {
            updateViewLayout(flutterView, layoutParams)
        }
    }

    private suspend fun updateViewLayout(view: View?, params: WindowManager.LayoutParams?) : Boolean {
        return suspendCoroutine {continuation ->
            try {
                CoroutineScope(Dispatchers.Main + SupervisorJob()).launch {
                    if (view != null && params != null && view.windowToken != null) windowManager.updateViewLayout(
                        view,
                        params
                    )
                    continuation.resume(true)
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error updating view layout", e)
                continuation.resume(false)
            }
        }
    }

    open override fun reportSize(width: Int, height: Int) {
        layoutParams.width = width
        layoutParams.height = height
        updateLayoutParams(layoutParams)
    }
}
