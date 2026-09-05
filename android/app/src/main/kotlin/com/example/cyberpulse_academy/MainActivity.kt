package com.example.cyberpulse_academy

import android.os.Bundle
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // FLAG_SECURE blocks screenshots AND screen recording for the
        // entire app, on every screen, since there is only one Activity
        // in a standard Flutter app — this one flag covers all of them.
        // It also makes the app's content show as a blank/black
        // rectangle in the Android Recents (app switcher) thumbnail,
        // which is the same mechanism banking and password-manager
        // apps use.
        window.setFlags(
            WindowManager.LayoutParams.FLAG_SECURE,
            WindowManager.LayoutParams.FLAG_SECURE
        )
    }
}
