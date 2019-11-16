import 'package:flutter/material.dart';
import 'package:flutter_git_trending/bloc/application_bloc.dart';
import 'package:flutter_git_trending/data/model/trending_repo_model.dart';
import 'package:flutter_git_trending/utils/toast_utils.dart';
import 'package:flutter_git_trending/utils/top_level.dart';
import 'package:flutter_git_trending/widgets/circular_progress.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UrlPage extends StatefulWidget {
  final String url;
  final bool showBookmark;
  final TrendingRepoItem repo;

  UrlPage(this.url, {this.showBookmark = false, this.repo});

  @override
  _UrlPageState createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> {
  final bookmark = ValueNotifier<bool>(null);

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    refreshBookmarkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      key: _scaffoldKey,
      hidden: true,
      initialChild: CircularProgress(),
      url: checkIfNotEmpty(widget.url) ? widget.url : "https://www.github.com",
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(FontAwesomeIcons.githubAlt),
            SizedBox(
              width: 16,
            ),
            Text("GitHub Trending"),
          ],
        ),
        actions: <Widget>[
          if (widget.showBookmark)
            ValueListenableBuilder(
              valueListenable: bookmark,
              builder: (context, value, child) {
                if (value != null)
                  return IconButton(
                    icon: Icon(value ? Icons.bookmark : Icons.bookmark_border),
                    onPressed: onBookmarkTap,
                  );
                else
                  return Container();
              },
            )
        ],
      ),
    );
  }

  void onBookmarkTap() {
    if (bookmark.value) {
      applicationBloc.removeBookmark(widget.repo);
      ToastUtils.showToast(message: "Removed from Bookmarks");
    } else {
      applicationBloc.addBookmark(widget.repo);
      ToastUtils.showToast(message: "Added to Bookmarks");
    }
    refreshBookmarkStatus();
  }

  void refreshBookmarkStatus() {
    bookmark.value = applicationBloc.isBookmarked(widget.url);
  }
}
