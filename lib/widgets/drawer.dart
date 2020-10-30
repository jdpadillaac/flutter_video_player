import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Drawer homeDrawer = Drawer(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _emailBoton(),
        ],
      ),
    ),
  ),
);

RaisedButton _emailBoton() {
  return RaisedButton(
    color: Colors.blue,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.email, color: Colors.white),
        SizedBox(width: 10),
      ],
    ),
    onPressed: () async {
      final String email =
          'mailto:<email@email.com>?subject=<subject>&body=<body>';
      if (await canLaunch(email)) {
        await launch(email);
      } else {
        throw 'Could not launch';
      }
    },
  );
}
