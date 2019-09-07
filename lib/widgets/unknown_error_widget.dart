import 'package:flutter/material.dart';
import 'package:flutter_git_trending/utils/constants.dart';

class UnknownErrorWidget extends StatelessWidget {
  final VoidCallback onTap;

  UnknownErrorWidget(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: 86,
              color: Colors.grey.withOpacity(0.9),
            ),
            SizedBox(
              height: 24,
            ),
            new Text(
              Constants.ERROR_SOMETHING_WRONG,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display1.copyWith(
                    fontSize: 20,
                  ),
            ),
            SizedBox(
              height: 24,
            ),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text(
                  "REFRESH",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                onPressed: onTap),
          ],
        ),
      ),
    );
  }
}
