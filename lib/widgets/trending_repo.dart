import 'package:flutter/material.dart';
import 'package:flutter_git_trending/data/model/trending_repo_model.dart';
import 'package:flutter_git_trending/pages/url_page.dart';
import 'package:flutter_git_trending/utils/hex_color.dart';
import 'package:flutter_git_trending/utils/top_level.dart';
import 'package:flutter_git_trending/widgets/repo_header.dart';

class TrendingRepo extends StatelessWidget {
  final TrendingRepoItem item;
  final int index;

  TrendingRepo(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
              border: Border.all(
                color: Color(0x4437474F),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RepoHeader(
                  item.name,
                  item.author,
                  item.avatar,
                  index,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 4,
                      ),
                      if(checkIfNotEmpty(item.language))
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 16,
                            width: 16,
                            decoration: new BoxDecoration(
                              color: HexColor(item.languageColor ?? "#ffffff"),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            (item.language ?? "").toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.blue[700],
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        item.description,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => UrlPage(item.url)));
          },
        ),
      ),
    );
  }
}
