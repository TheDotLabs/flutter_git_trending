import 'dart:convert';
import 'dart:io';

import 'package:flutter_git_trending/data/model/trending_developer_model.dart';
import 'package:flutter_git_trending/data/model/trending_repo_model.dart';
import 'package:flutter_git_trending/utils/ApiEndpint.dart';
import 'package:flutter_git_trending/utils/api_helper.dart';
import 'package:flutter_git_trending/utils/stream_response.dart';
import 'package:rxdart/rxdart.dart';

class TrendingRepoBloc {
  final _dataSubject = BehaviorSubject<List<TrendingRepoItem>>();

  get dataStream => _dataSubject.stream;

  void fetchData() async {
    try {
      _dataSubject.add(null);
      var response = await ApiHelper().get(endpoint: ApiEndpoint.repo);
      if (response.isSuccess) {
        var model = TrendingRepoModel.fromMapList(list: json.decode(response.body));
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
