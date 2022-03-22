package com.example.orilla_fresca
import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory


class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("YOUR_API_KEY")
        super.configureFlutterEngine(flutterEngine)
    }
}
