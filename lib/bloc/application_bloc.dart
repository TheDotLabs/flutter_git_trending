import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_git_trending/data/model/language_model.dart';
import 'package:flutter_git_trending/data/prefs_helper.dart';
import 'package:flutter_git_trending/utils/ApiEndpint.dart';
import 'package:flutter_git_trending/utils/api_helper.dart';
import 'package:flutter_git_trending/utils/stream_response.dart';
import 'package:flutter_git_trending/utils/top_level.dart';
import 'package:rxdart/rxdart.dart';

ApplicationBloc applicationBloc = new ApplicationBloc();

class ApplicationBloc {
  static ApplicationBloc _instance;
  final _languages = BehaviorSubject<List<LanguageItem>>(seedValue: null);
  final currentLanguage = ValueNotifier<LanguageItem>(null);

  factory ApplicationBloc() {
    if (_instance == null)
      return _instance = ApplicationBloc._internal();
    else
      return _instance;
  }

  ApplicationBloc._internal();

  get languages => _languages.stream;

  get languagesSink => _languages.sink;

  init() {
    _setCurrentLanguage();
    _initLanguages();
    _fetchLanguage();
  }

  void _fetchLanguage() async {
    try {
      _languages.add(null);
      var response = await ApiHelper().get(endpoint: ApiEndpoint.languages);
      if (response.isSuccess) {
        var list = json.decode(response.body);
        var model = LanguageModel.fromMapList(list: list);
        _languages.sink.add(model.list);
        prefsHelper.saveLanguages(response.body);
      } else {
        _languages.addError(StreamError.serverError(response.statusCode));
      }
    } on SocketException catch (e) {
      _languages.addError(StreamError.offline());
    } catch (e) {
      _languages.addError(StreamError.unknownError());
    }
  }

  void _initLanguages() {
    var rawLanguage = prefsHelper.getLanguages();
    if (checkIfNotEmpty(prefsHelper.getLanguages())) {
      try {
        var list = json.decode(rawLanguage);
        var model = LanguageModel.fromMapList(list: list);
        _languages.sink.add(model.list);
      } catch (e) {
        _languages.addError(StreamError.unknownError());
      }
    }
  }

  void setCurrentLanguage(LanguageItem item) {
    if (item == null)
      prefsHelper.currentLanguage(null);
    else
      prefsHelper.currentLanguage(jsonEncode(item));
    currentLanguage.value = item;
  }

  void _setCurrentLanguage() {
    if (checkIfNotEmpty(prefsHelper.getCurrentLanguage())) {
      currentLanguage.value =
          LanguageItem.fromJson(jsonDecode(prefsHelper.getCurrentLanguage()));
    }
  }
}
