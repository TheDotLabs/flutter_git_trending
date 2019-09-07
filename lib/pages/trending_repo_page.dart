import 'package:flutter/material.dart';
import 'package:flutter_git_trending/bloc/trending_repo_bloc.dart';
import 'package:flutter_git_trending/data/model/trending_repo_model.dart';
import 'package:flutter_git_trending/widgets/circular_progress.dart';
import 'package:flutter_git_trending/widgets/stream_error_widget.dart';
import 'package:flutter_git_trending/widgets/stream_loading_widget.dart';
import 'package:flutter_git_trending/widgets/trending_repo.dart';

class TrendingRepoPage extends StatefulWidget {
  @override
  _TrendingRepoPageState createState() => _TrendingRepoPageState();
}

class _TrendingRepoPageState extends State<TrendingRepoPage>
    with AutomaticKeepAliveClientMixin<TrendingRepoPage> {
  final bloc = TrendingRepoBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    bloc.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: bloc.dataStream,
        builder: (context, AsyncSnapshot<List<TrendingRepoItem>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<TrendingRepoItem> list = snapshot.data;
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              children: <Widget>[
                /*SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        ChoiceChip(
                          label: Text(
                            "All",
                          ),
                          selected: true,
                         */ /* selectedColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black87),
                          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue[700]),borderRadius: BorderRadius.all(Radius.circular(16))),
                         */ /* onSelected: (selected){

                          },
                        ),
                        // ...languages.map((item) => Chip(label: Text(item["name"]))).toList()
                        ChoiceChip(
                          label: Text("+ Add"),
                          selected: false,
                        ),
                      ],
                    ),
                  ),*/
                ...list
                    .map((item) => TrendingRepo(item, list.indexOf(item)))
                    .toList(),
              ],
            );
            /* return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                itemBuilder: (context, index) => TrendingRepo(list[index],index),
                itemCount: list.length,
              );*/

          } else if (snapshot.hasError) {
            return StreamErrorWidget(snapshot.error,bloc.fetchData);
          } else {
            return StreamLoadingWidget();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
