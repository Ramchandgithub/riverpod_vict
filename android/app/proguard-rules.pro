# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn proguard.annotation.Keep
-dontwarn proguard.annotation.KeepClassMembers
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.PaymentsClient
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.Wallet
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.WalletUtils
-dontwarn com.google.android.play.core.splitinstall.SplitInstallException
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManager
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManagerFactory
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest$Builder
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest
-dontwarn com.google.android.play.core.splitinstall.SplitInstallSessionState
-dontwarn com.google.android.play.core.splitinstall.SplitInstallStateUpdatedListener
-dontwarn com.google.android.play.core.tasks.OnFailureListener
-dontwarn com.google.android.play.core.tasks.OnSuccessListener
-dontwarn com.google.android.play.core.tasks.Task
-dontwarn android.window.BackEvent


# Keep Google Play Core classes
-keep class com.google.android.play.** { *; }

# Keep Flutter Deferred Components
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }

# Keep Razorpay Analytics and Annotations

# Keep Tasks API
-keep class com.google.android.play.core.tasks.** { *; }

# Keep Split Install Manager
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.android.org.conscrypt.** { *; }
-keep class javax.annotation.** { *; }
-keep class org.apache.harmony.xnet.provider.jsse.** { *; }
