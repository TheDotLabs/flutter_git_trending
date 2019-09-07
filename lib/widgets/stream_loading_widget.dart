import 'package:flutter/material.dart';

class StreamLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(
        strokeWidth: 1.5,
      ),
    );
  }
}
