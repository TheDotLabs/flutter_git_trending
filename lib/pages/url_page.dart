import 'package:flutter/material.dart';
import 'package:flutter_git_trending/utils/top_level.dart';
import 'package:flutter_git_trending/widgets/circular_progress.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UrlPage extends StatefulWidget {
  final String url;

  UrlPage(this.url);

  @override
  _UrlPageState createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
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
      ),
    );
  }
}
