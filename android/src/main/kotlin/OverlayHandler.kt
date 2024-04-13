object OverlayManager {
    private val overlays: MutableMap<String, OverlayInterface> = HashMap()
    fun getOverlay(name: String): OverlayInterface? {
        return overlays[name]
    }

    fun hasOverlay(name: String): Boolean {
        return overlays.containsKey(name)
    }

    fun setOverlay(name: String, view: OverlayInterface) {
        overlays[name] = view
    }
}
