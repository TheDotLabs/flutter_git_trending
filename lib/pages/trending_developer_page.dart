import 'package:flutter/material.dart';
import 'package:flutter_git_trending/bloc/trending_developer_bloc.dart';
import 'package:flutter_git_trending/data/model/trending_developer_model.dart';
import 'package:flutter_git_trending/widgets/stream_error_widget.dart';
import 'package:flutter_git_trending/widgets/stream_loading_widget.dart';
import 'package:flutter_git_trending/widgets/trending_developer.dart';

class TrendingDeveloperPage extends StatefulWidget {
  @override
  _TrendingDeveloperPageState createState() => _TrendingDeveloperPageState();
}

class _TrendingDeveloperPageState extends State<TrendingDeveloperPage>
    with AutomaticKeepAliveClientMixin<TrendingDeveloperPage> {
  final bloc = TrendingDeveloperBloc();

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
        builder:
            (context, AsyncSnapshot<List<TrendingDeveloperItem>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<TrendingDeveloperItem> list = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              itemBuilder: (context, index) =>
                  TrendingDeveloper(list[index], index),
              itemCount: list.length,
            );
          } else if (snapshot.hasError) {
            return StreamErrorWidget(snapshot.error, bloc.fetchData);
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
