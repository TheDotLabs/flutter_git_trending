import 'package:flutter/material.dart';
import 'package:flutter_git_trending/bloc/application_bloc.dart';
import 'package:flutter_git_trending/data/model/trending_repo_model.dart';
import 'package:flutter_git_trending/widgets/no_items_found.dart';
import 'package:flutter_git_trending/widgets/stream_error_widget.dart';
import 'package:flutter_git_trending/widgets/stream_loading_widget.dart';
import 'package:flutter_git_trending/widgets/trending_repo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookmarkPage extends StatefulWidget {
  BookmarkPage();

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text("Bookmarks"),
          ],
        ),
      ),
      body: Container(
        child: StreamBuilder(
          stream: applicationBloc.bookmark,
          builder: (context, AsyncSnapshot<List<TrendingRepoItem>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              var list = snapshot.data;
              return list.length > 0
                  ? ListView(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      children: <Widget>[
                        ...list
                            .map((item) =>
                                TrendingRepo(item, list.indexOf(item)))
                            .toList(),
                      ],
                    )
                  : NoItemsFound();
            } else if (snapshot.hasError) {
              return StreamErrorWidget(snapshot.error, null);
            } else {
              return StreamLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
