package com.example.orilla_fresca
import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory


class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("1895e2aa-aac6-4d69-b0f8-7cc4cdddeab2")
        super.configureFlutterEngine(flutterEngine)
    }
}
