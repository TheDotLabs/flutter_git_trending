import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_git_trending/utils/top_level.dart';

class Profile extends StatelessWidget {
  final String name;
  final String username;
  final String avatar;
  final int index;

  Profile(this.name, this.username, this.avatar, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 36,
            width: 36,
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(avatar),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  checkIfNotEmpty(name) ? name : "NA",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  checkIfNotEmpty(username) ? username : "NA",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Text(
            "#${index+1}",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
