package com.example.portfolio_prj

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {


    private val CHANNEL = "duykhangdeptrai"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        // This method is invoked on the main thread.
        call, result ->
        if (call.method == "getNameDepTrai") {
            result.success(getNameDepTrai())
        } else {
            result.notImplemented()
            }
        }
    }

    private fun getNameDepTrai(): String {
        return "ANH KHANG DEP TRAI"
    }

}
