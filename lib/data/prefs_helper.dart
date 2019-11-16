import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

SharedPrefsHelper prefsHelper = new SharedPrefsHelper();

class SharedPrefsHelper {
  static SharedPrefsHelper _instance;
  SharedPreferences _prefs;
  static const String PREFS_LAST_LOCATION_LIST = 'trackLocationList';
  static const String PREFS_LANGUAGES_LIST = '"languagesData"';
  static const String PREFS_CURRENT_LANGUAGE = '"currentLanguage"';
  static const String PREFS_BOOKMARKS = 'bookmark';

  factory SharedPrefsHelper() {
    if (_instance == null)
      return _instance = SharedPrefsHelper._internal();
    else
      return _instance;
  }

  SharedPrefsHelper._internal();

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  void checkIsInitialize() {
    if (_prefs == null)
      throw Exception(
          "Call prefsHelper.initialize first before using Shared Prefs");
  }

  void clear() {
    _prefs.clear();
  }

  Future<void> refresh() async {
    await _prefs.reload();
  }

  void saveLanguages(String body) {
    _prefs.setString(PREFS_LANGUAGES_LIST, body);
  }

  String getLanguages() {
    return _prefs.getString(PREFS_LANGUAGES_LIST);
  }

  void currentLanguage(String jsonEncode) {
    _prefs.setString(PREFS_CURRENT_LANGUAGE, jsonEncode);
  }

  String getCurrentLanguage() {
    return _prefs.getString(PREFS_CURRENT_LANGUAGE);
  }

  List<String> getBookmarks() {
    return _prefs.getStringList(PREFS_BOOKMARKS) ?? List<String>();
  }

  void saveBookmarks(List<String> list) {
    _prefs.setStringList(PREFS_BOOKMARKS, list);
  }
}
