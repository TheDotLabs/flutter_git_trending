import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_git_trending/bloc/application_bloc.dart';
import 'package:flutter_git_trending/data/model/language_model.dart';
import 'package:flutter_git_trending/pages/about_page.dart';
import 'package:flutter_git_trending/pages/trending_developer_page.dart';
import 'package:flutter_git_trending/pages/trending_repo_page.dart';
import 'package:flutter_git_trending/utils/top_level.dart';
import 'package:flutter_git_trending/widgets/search_text_field.dart';
import 'package:flutter_git_trending/widgets/stream_error_widget.dart';
import 'package:flutter_git_trending/widgets/stream_loading_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
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
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: onInfoTap,
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "REPOS",
              ),
              Tab(
                text: "DEVELOPERS",
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(children: [
                TrendingRepoPage(),
                TrendingDeveloperPage(),
              ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.filter_list),
          onPressed: onFABTap,
          backgroundColor: Colors.grey[200],
        ),
        drawer: Drawer(
          child: Container(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Welcome to Github Trending",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  /* ListTile(
                    leading: Icon(FontAwesomeIcons.bookmark),
                    title: Text("Bookmark"),
                  ),*/
                  ListTile(
                    leading: Icon(FontAwesomeIcons.dev),
                    title: Text("About Me"),
                    onTap: () {
                      Navigator.pop(context);
                      onInfoTap();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onInfoTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AboutPage()));
  }

  void onFABTap() {
    Observable<List<LanguageItem>> filter;

    var langugeStream = ApplicationBloc().languages;
    final _controller = TextEditingController();
    filter = langugeStream.transform<List<LanguageItem>>(
      StreamTransformer<List<LanguageItem>, List<LanguageItem>>.fromHandlers(
          handleData: (list, sink) {
        if (checkIfNotEmpty(_controller.text)) {
          var list1 = list.where((item) {
            return item.name
                .toLowerCase()
                .contains(_controller.text.toLowerCase());
          }).toList();
          return sink.add(list1);

          // return sink.add(list.where((item)=>(item as Map).values.contains(element)));
        } else
          return sink.add(list);
      }),
    ).asBroadcastStream();
    _controller.addListener(() {
      ApplicationBloc().languagesSink.add(langugeStream.value);
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select Language"),
        content: StreamBuilder(
          stream: filter,
          builder: (context, AsyncSnapshot<List<LanguageItem>> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              var rawList = snapshot.data;
              final list=List<LanguageItem>();
              list.addAll(rawList);
              if (applicationBloc.currentLanguage.value != null) {
                list.remove(applicationBloc.currentLanguage.value);
                list.insert(0, applicationBloc.currentLanguage.value);
              }
              return Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    SearchTextField(_controller),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        itemBuilder: (context, index) => ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          title: Text(list[index].name),
                          onTap: () {
                            Navigator.pop(context);
                            onItemTap(list[index]);
                          },
                          trailing: (ApplicationBloc().currentLanguage.value !=
                                      null &&
                                  ApplicationBloc()
                                          .currentLanguage
                                          .value
                                          .name ==
                                      list[index].name)
                              ? Icon(
                                  Icons.done,
                                  color: Colors.blue,
                                )
                              : null,
                        ),
                        separatorBuilder: (context, index) => Divider(
                          height: 1,
                        ),
                        itemCount: list.length,
                      ),
                    ),
                  ],
                ),
              );
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

  void onItemTap(LanguageItem item) async {
    await Future.delayed(Duration(milliseconds: 300));

    if (applicationBloc.currentLanguage.value != null &&
        applicationBloc.currentLanguage.value == item) {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Language filter removed"),
      ));
      ApplicationBloc().setCurrentLanguage(null);
    } else {
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Language changed to ${item.name}"),
      ));
      ApplicationBloc().setCurrentLanguage(item);
    }
  }
}
