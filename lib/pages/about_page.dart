import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: Text("About Me"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.fitWidth,
              color: Colors.grey[700].withOpacity(0.5),
            ),
            height: double.infinity,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Material(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  color: Colors.transparent,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                    radius: 44.0,
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  "Ayush P Gupta",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "ayushpguptaapg@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                Row(
                  children: <Widget>[
                    CircularButton(FontAwesomeIcons.mediumM,
                        "https://medium.com/@ayushpguptaapg"),
                    HorizontalSpacing(),
                    CircularButton(FontAwesomeIcons.instagram,
                        "https://www.instagram.com/ayushpgupta/"),
                    HorizontalSpacing(),
                    CircularButton(
                        FontAwesomeIcons.github, "https://github.com/apgapg"),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: <Widget>[
                    CircularButton(FontAwesomeIcons.facebookF,
                        "https://www.facebook.com/ayushpgupta"),
                    HorizontalSpacing(),
                    CircularButton(FontAwesomeIcons.googlePlusG,
                        "https://medium.com/@ayushpguptaapg"),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
                SizedBox(
                  height: 64.0,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL("https://about.me/ayushpgupta");
                  },
                  child: Text(
                    "https://about.me/ayushpgupta",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class CircularButton extends StatefulWidget {
  final IconData iconData;

  final String url;

  CircularButton(this.iconData, this.url);

  @override
  CircularButtonState createState() {
    return new CircularButtonState();
  }
}

class CircularButtonState extends State<CircularButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Colors.black87)),
      child: GestureDetector(
        onTap: () {
          _launchURL(widget.url);
        },
        child: Icon(
          widget.iconData,
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class HorizontalSpacing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.0,
    );
  }
}
