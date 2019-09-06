import 'package:flutter/material.dart';
import 'package:flutter_git_trending/pages/about_page.dart';
import 'package:flutter_git_trending/pages/trending_developer_page.dart';
import 'package:flutter_git_trending/pages/trending_repo_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                    onTap: (){
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
}
