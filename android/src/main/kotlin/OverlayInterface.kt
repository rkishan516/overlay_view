
import android.view.WindowManager
import android.view.WindowManager.LayoutParams


interface OverlayInterface {
    fun addView()
    fun removeView()
    fun show()
    fun hide()
    fun getLayoutParams() : WindowManager.LayoutParams
    fun updateLayoutParams(layoutParams: LayoutParams)
    fun reportSize(width: Int, height: Int)
}
