import 'dart:convert';
import 'dart:io';

import 'package:flutter_git_trending/bloc/application_bloc.dart';
import 'package:flutter_git_trending/data/model/trending_repo_model.dart';
import 'package:flutter_git_trending/utils/ApiEndpint.dart';
import 'package:flutter_git_trending/utils/api_helper.dart';
import 'package:flutter_git_trending/utils/stream_response.dart';
import 'package:flutter_git_trending/utils/top_level.dart';
import 'package:rxdart/rxdart.dart';

class TrendingRepoBloc {
  final _dataSubject = BehaviorSubject<List<TrendingRepoItem>>();

  get dataStream => _dataSubject.stream;

  TrendingRepoBloc() {
    ApplicationBloc().currentLanguage.addListener(() {
      fetchData();
    });
  }

  void fetchData() async {
    try {
      _dataSubject.add(null);
      var url = ApiEndpoint.repo;
      if (checkIfNotEmpty(ApplicationBloc().currentLanguage.value?.urlParam)) {
        url =
            ApiEndpoint.repo + ApplicationBloc().currentLanguage.value.urlParam;
      }
      var response = await ApiHelper().get(endpoint: url);
      if (response.isSuccess) {
        var model =
            TrendingRepoModel.fromMapList(list: json.decode(response.body));
        _dataSubject.sink.add(model.list);
      } else {
        _dataSubject.addError(StreamError.serverError(response.statusCode));
      }
    } on SocketException catch (e) {
      _dataSubject.addError(StreamError.offline());
    } catch (e) {
      _dataSubject.addError(StreamError.unknownError());
    }
  }

  dispose() {
    _dataSubject.close();
  }
}
