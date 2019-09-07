import 'package:flutter/material.dart';
import 'package:flutter_git_trending/utils/stream_response.dart';
import 'package:flutter_git_trending/widgets/internet_not_available.dart';
import 'package:flutter_git_trending/widgets/server_error_widget_new.dart';
import 'package:flutter_git_trending/widgets/unknown_error_widget.dart';

class StreamErrorWidget extends StatelessWidget {
  final dynamic streamError;
  final VoidCallback onTap;

  StreamErrorWidget(this.streamError, this.onTap);

  @override
  Widget build(BuildContext context) {
    Widget widget = getWidget();
    return widget;
  }

  Widget getWidget() {
    if (streamError is StreamError) {
      var error = streamError as StreamError;
      if (error.type == ErrorType.Offline)
        return InternetNotAvailable(onTap);
      else if (error.type == ErrorType.ServerError)
        return ServerErrorWidgetNew(error.msg, onTap);
      else
        return UnknownErrorWidget(onTap);
    } else {
      return UnknownErrorWidget(onTap);
    }
  }
}
