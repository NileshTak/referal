import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class SocialMediaButton extends StatelessWidget {
  onUrl(String url, {String fallbackUrl}) async {
    // try {
    //   bool launched =
    //       await launch(url, forceSafariVC: false, forceWebView: false);
    //   if (!launched) {
    //     await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    //   }
    // } catch (e) {
    //   await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    // }
  }

  onInstagram() {}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialIcon(
          url: 'assets/fb.png',
          // onPress: () => onUrl("fb://page/102634668674034",
          //     fallbackUrl: "https://www.facebook.com/truckbaziofficial")
        ),
        SocialIcon(
          url: 'assets/wp.png',
          // onPress: () => onUrl("fb://page/102634668674034",
          //     fallbackUrl: "https://www.facebook.com/truckbaziofficial")
        ),
        SocialIcon(
          url: 'assets/twitter.png',
          // onPress: () => onUrl("https://mobile.twitter.com/truckbazi")
        ),
        SocialIcon(
          url: 'assets/g.png',
          // onPress: () => onUrl(
          //     "https://www.instagram.com/truckbazi_official/?igshid=1gy8t2pgu2uhk"),
        ),
        SocialIcon(
          url: 'assets/in.png',
          // onPress: () => onUrl("https://in.pinterest.com/truckbazi/_saved/"),
        ),
        SocialIcon(
          url: 'assets/dot1.png',
          // onPress: () => onUrl("https://in.pinterest.com/truckbazi/_saved/"),
        ),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String url;
  final Function onPress;
  const SocialIcon({@required this.url, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        child: Image.asset(url, width: 46, height: 46),
      ),
    );
  }
}
