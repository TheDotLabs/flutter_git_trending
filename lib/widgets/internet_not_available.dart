import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_git_trending/utils/constants.dart';

class InternetNotAvailable extends StatelessWidget {
  final VoidCallback onTap;

  InternetNotAvailable(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: new Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.cloud_off,
              size: 86,
              color: Colors.grey.withOpacity(0.9),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              Constants.ERROR_NETWORK_NOT_AVAILABLE,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display1.copyWith(
                    fontSize: 18,
                  ),
            ),
            SizedBox(
              height: 24,
            ),
            RaisedButton(
              child: Text(
                "REFRESH",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: onTap,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
