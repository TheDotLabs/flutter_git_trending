import 'package:flutter/material.dart';
import 'package:flutter_git_trending/utils/top_level.dart';

class NoItemsFound extends StatelessWidget {
  final String text;

  NoItemsFound({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.folder_open,
              size: 86,
              color: Colors.grey.withOpacity(0.9),
            ),
            SizedBox(
              height: 24,
            ),
            new Text(
              checkIfNotEmpty(text) ? text : "No items found",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display1.copyWith(
                    fontSize: 20,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
