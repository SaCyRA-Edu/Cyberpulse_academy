# Firebase / Google / Facebook Sign-In Setup

The app now has full Google, Facebook, and Email/Password sign-in code
built in — but it needs to be connected to a real Firebase project before
any of it will actually work. This is the one part I genuinely can't do
for you, since it requires your own Google account and generates secret
keys tied to your identity.

Follow these steps in order. It looks long, but each step is quick —
expect 20-30 minutes total.

---

## Part 1 — Create your Firebase project

1. Go to https://console.firebase.google.com and sign in with your Google
   account.
2. Click **Add project**. Name it whatever you like (e.g.
   "Learning Cybersecurity"). Google Analytics is optional — you can
   disable it for this project.
3. Wait for the project to finish creating, then you'll land on its
   dashboard.

## Part 2 — Enable the sign-in methods you want

1. In the left sidebar, go to **Build > Authentication**.
2. Click **Get started**.
3. Under the **Sign-in method** tab, enable each of these:
   - **Email/Password** — just toggle it on and save.
   - **Google** — toggle it on, pick a support email (your own email is
     fine), save.
   - **Facebook** — you'll need a Facebook App ID and App Secret before
     you can enable this. See Part 4 below, then come back and finish
     this step.

## Part 3 — Install the FlutterFire CLI and connect your project

This is the step that actually generates the real `lib/firebase_options.dart`
file, replacing the placeholder one already in the project.

1. Make sure you have the Firebase CLI installed. If not:
   ```powershell
   npm install -g firebase-tools
   firebase login
   ```
   (This needs Node.js installed. If you don't have it, grab it from
   https://nodejs.org first.)

2. Install the FlutterFire CLI:
   ```powershell
   dart pub global activate flutterfire_cli
   ```

3. From your project root, run:
   ```powershell
   cd C:\Users\rajee\Downloads\cyberpulse_academy_repo\cyberpulse_academy
   flutterfire configure
   ```

4. It will ask you to:
   - Select the Firebase project you just created
   - Select which platforms to configure — choose **android** (and
     **web** if you also want it working in Chrome)
   - It may ask for your Android package name — check
     `android/app/build.gradle.kts` under `applicationId` if unsure

5. This automatically **overwrites** the placeholder
   `lib/firebase_options.dart` with your real project's configuration.
   You don't need to edit it by hand.

6. It also automatically drops a real `google-services.json` file into
   `android/app/`. Don't move or rename it.

## Part 4 — Set up Facebook Login (only if you want the Facebook button working)

1. Go to https://developers.facebook.com/apps and log in with a Facebook
   account.
2. Click **Create App** > choose **Consumer** (or "Authenticate and
   request data from users with Facebook Login") as the use case.
3. Name your app, create it.
4. In the app dashboard, add the **Facebook Login** product.
5. Go to **App Settings > Basic**. Note down:
   - **App ID**
   - **App Secret** (click "Show" to reveal it)
6. Go back to Firebase Console > Authentication > Sign-in method >
   Facebook, and paste in the App ID and App Secret there, then save.
7. Firebase will show you an **OAuth redirect URI** — copy it.
8. Back in the Facebook app dashboard, go to **Facebook Login > Settings**,
   and paste that redirect URI into **Valid OAuth Redirect URIs**, then
   save.
9. In `android/app/src/main/AndroidManifest.xml`, inside the
   `<application>` tag, add:
   ```xml
   <meta-data android:name="com.facebook.sdk.ApplicationId"
       android:value="@string/facebook_app_id"/>
   <meta-data android:name="com.facebook.sdk.ClientToken"
       android:value="@string/facebook_client_token"/>
   <activity android:name="com.facebook.FacebookActivity"
       android:configChanges="keyboard|keyboardHidden|screenLayout|screenSize|orientation"
       android:label="@string/app_name" />
   <activity android:name="com.facebook.CustomTabActivity"
       android:exported="true">
     <intent-filter>
       <action android:name="android.intent.action.VIEW" />
       <category android:name="android.intent.category.DEFAULT" />
       <category android:name="android.intent.category.BROWSABLE" />
       <data android:scheme="@string/fb_login_protocol_scheme" />
     </intent-filter>
   </activity>
   ```
10. Create (or edit) `android/app/src/main/res/values/strings.xml`:
    ```xml
    <?xml version="1.0" encoding="utf-8"?>
    <resources>
        <string name="app_name">Learning Cybersecurity</string>
        <string name="facebook_app_id">YOUR_APP_ID_HERE</string>
        <string name="fb_login_protocol_scheme">fbYOUR_APP_ID_HERE</string>
        <string name="facebook_client_token">YOUR_CLIENT_TOKEN_HERE</string>
    </resources>
    ```
    (Find the Client Token in the Facebook app dashboard under
    **Settings > Advanced > Security > Client Token**.)

If you'd rather skip Facebook for now, that's completely fine — Google
and Email/Password sign-in work independently and the Facebook button
will just show a clear error if tapped before this part is done.

## Part 5 — Get your app's SHA-1 fingerprint (required for Google sign-in on Android)

Google Sign-In on Android needs your app's signing certificate
fingerprint registered with Firebase.

1. Run this from your project root:
   ```powershell
   cd android
   .\gradlew signingReport
   ```
2. Look for the **SHA1** value under the `debug` variant in the output.
3. Go to Firebase Console > Project Settings (gear icon) > your Android
   app > **Add fingerprint** > paste the SHA1 value > Save.
4. Download the updated `google-services.json` from that same page and
   replace the one in `android/app/`.

(When you eventually build a signed release APK for the Play Store,
you'll need to repeat this step with your **release** keystore's SHA-1
too — the debug one only works for development builds like the ones
you run via `flutter run`.)

## Part 6 — Install and run

```powershell
flutter pub get
flutter run
```

---

## What you'll see if a step isn't done yet

The app is designed to fail gracefully rather than crash:
- If Firebase itself isn't configured yet (`firebase_options.dart` is
  still the placeholder), the app still launches, but tapping any
  sign-in button will show a clear error message instead of working.
- If only Facebook isn't set up yet, Google and Email sign-in still work
  fine — only the Facebook button will error out until Part 4 is done.

## Where user accounts show up

Firebase Console > Authentication > **Users** tab lists everyone who has
signed up, however they signed in (Google/Facebook/Email).

## A note on progress data

Right now, lesson progress, notes, and exam scores are still stored
locally on each device (via `shared_preferences`), same as before this
change — signing in currently only gates access and shows a profile. If
you want progress to sync across devices tied to each signed-in account
(e.g. via Cloud Firestore), that's a natural next step I can build once
this authentication layer is confirmed working end-to-end.
