import 'dart:convert';
import 'dart:io';

import 'package:flutter_git_trending/data/model/trending_developer_model.dart';
import 'package:flutter_git_trending/utils/ApiEndpint.dart';
import 'package:flutter_git_trending/utils/api_helper.dart';
import 'package:flutter_git_trending/utils/stream_response.dart';
import 'package:rxdart/rxdart.dart';

class TrendingDeveloperBloc {
  final _dataSubject = BehaviorSubject<StreamData>();

  get dataStream => _dataSubject.stream;

  void fetchData() async {
    try {
      _dataSubject.addError(StreamData.loading());
      var response = await ApiHelper().get(endpoint: ApiEndpoint.trending);
      if (response.isSuccess) {
        var model = TrendingDeveloperModel.fromMapList(list: json.decode(response.body));
        _dataSubject.sink.add(StreamData.data(model.list));
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
