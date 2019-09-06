import 'package:flutter_git_trending/utils/constants.dart';

enum ResponseType { Loading, Data }

class StreamData<T> {
  ResponseType type;
  T value;

  StreamData(this.type, this.value);

  StreamData.loading() {
    type = ResponseType.Loading;
    value = null;
  }

  StreamData.data(data) {
    type = ResponseType.Data;
    value = data;
  }
}

enum ErrorType { Offline, ServerError, UnknownError }

class StreamError {
  ErrorType type;
  String msg;

  StreamError(this.type, this.msg);

  StreamError.offline() {
    type = ErrorType.Offline;
    msg = Constants.ERROR_NETWORK_NOT_AVAILABLE;
  }

  StreamError.serverError(statusCode) {
    type = ErrorType.ServerError;
    msg = "Server Error: " + statusCode;
  }

  StreamError.unknownError() {
    type = ErrorType.UnknownError;
    msg = Constants.ERROR_SOMETHING_WRONG;
  }
}
