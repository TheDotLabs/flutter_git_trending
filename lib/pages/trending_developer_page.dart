import 'package:flutter/material.dart';
import 'package:flutter_git_trending/bloc/trending_developer_bloc.dart';
import 'package:flutter_git_trending/data/model/trending_developer_model.dart';
import 'package:flutter_git_trending/utils/stream_response.dart';
import 'package:flutter_git_trending/widgets/circular_progress.dart';
import 'package:flutter_git_trending/widgets/trending_developer.dart';

class TrendingDeveloperPage extends StatefulWidget {
  @override
  _TrendingDeveloperPageState createState() => _TrendingDeveloperPageState();
}

class _TrendingDeveloperPageState extends State<TrendingDeveloperPage> with AutomaticKeepAliveClientMixin<TrendingDeveloperPage> {
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
        builder: (context, AsyncSnapshot<StreamData> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.type == ResponseType.Loading) {
              return Text("fwef");
            } else {
              List<TrendingDeveloperItem> list = snapshot.data.value;
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                itemBuilder: (context, index) => TrendingDeveloper(list[index],index),
                itemCount: list.length,
              );
            }
          } else if (snapshot.hasError) {
            return Text("ffer");
          } else {
            return CircularProgress();
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
