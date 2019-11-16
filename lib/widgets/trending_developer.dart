import 'package:flutter/material.dart';
import 'package:flutter_git_trending/data/model/trending_developer_model.dart';
import 'package:flutter_git_trending/pages/url_page.dart';
import 'package:flutter_git_trending/widgets/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TrendingDeveloper extends StatelessWidget {
  final TrendingDeveloperItem item;
  final int index;

  TrendingDeveloper(this.item, this.index);

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
                Profile(
                  item.name,
                  item.username,
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
                        height: 2,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.hotjar,
                            color: Colors.orange,
                            size: 16,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text(
                              "POPULAR",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        item.repo.name,
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
                        item.repo.description,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UrlPage(item.repo.url)));
          },
        ),
      ),
    );
  }
}
