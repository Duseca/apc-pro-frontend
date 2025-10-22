import 'package:apc_pro/config/theme/light_theme.dart';
import 'package:apc_pro/config/theme/theme_share_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeProvider with ChangeNotifier, WidgetsBindingObserver {
  ThemeMode themeMode = ThemeMode.system;
  late ThemeData _currentTheme;
  late bool _isDarkMode;

  ThemeProvider() {
    // Initialize based on saved preference or system brightness
    final savedTheme =
        UserPreferences.getTheme(); // 'DARK_MODE', 'LIGHT_MODE', or 'SYSTEM'
    final systemBrightness = WidgetsBinding.instance.window.platformBrightness;

    if (savedTheme == 'DARK_MODE') {
      _currentTheme = darkTheme;
      _isDarkMode = true;
    } else if (savedTheme == 'LIGHT_MODE') {
      _currentTheme = lightTheme;
      _isDarkMode = false;
    } else {
      // Default to system brightness if 'SYSTEM'
      _currentTheme =
          systemBrightness == Brightness.dark ? darkTheme : lightTheme;
      _isDarkMode = systemBrightness == Brightness.dark;
    }

    WidgetsBinding.instance.addObserver(this); // Observe platform changes
  }

  ThemeData get currentTheme => _currentTheme;
  bool get isDarkMode =>
      themeMode == ThemeMode.dark ||
      (themeMode == ThemeMode.system &&
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark);
  void toggleTheme(bool isDarkMode) {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    // Check system brightness
    final systemBrightness = WidgetsBinding.instance.window.platformBrightness;

    // Only update theme if user preference is set to 'SYSTEM'
    if (UserPreferences.getTheme() == 'SYSTEM') {
      _currentTheme =
          systemBrightness == Brightness.dark ? darkTheme : lightTheme;
      _isDarkMode = systemBrightness == Brightness.dark;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}

class ThemeConfig extends GetxController {
  static ThemeConfig instance = Get.find<ThemeConfig>();
  RxBool isDarkTheme = false.obs;
  onToggle() {
    isDarkTheme.value = !isDarkTheme.value;
    isDarkTheme.value
        ? Get.changeTheme(darkTheme)
        : Get.changeTheme(lightTheme);
    UserPreferences.setTheme(
      isDarkTheme.value ? 'DARK_MODE' : 'LIGHT_MODE',
    );
  }
}
