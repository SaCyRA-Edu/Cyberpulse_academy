package com.sacyra.cyberpulseacademy

import android.os.Bundle
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {

    // TEMPORARY SWITCH for taking Play Store screenshots.
    // true  = screenshots and screen recording ALLOWED (never ship this)
    // false = screenshots and screen recording BLOCKED (the normal, release setting)
    // Set this back to false, and confirm a screenshot is blocked, BEFORE
    // building the app bundle you upload to Play Console.
    private val allowScreenshots = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (!allowScreenshots) {
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
}
