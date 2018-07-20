package com.ly.settings;

import android.content.Intent;
import android.provider.Settings;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class SettingsPlugin implements MethodCallHandler {
    private Registrar registrar;

    private SettingsPlugin(Registrar registrar) {
        this.registrar = registrar;
    }

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "plugins.ly.com/settings");
        channel.setMethodCallHandler(new SettingsPlugin(registrar));
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        switch (call.method) {
            case "wifi":
                openWiFiSettings();
                result.success(true);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void openWiFiSettings() {
        registrar.activity().startActivity(new Intent(Settings.ACTION_WIFI_SETTINGS));
    }

}
