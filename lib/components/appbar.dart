import 'package:flutter/material.dart';

class ApplicationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text("Trending Deals",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    );
  }
}
