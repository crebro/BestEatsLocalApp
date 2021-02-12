import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ApplicationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Builder(
              builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu),
                  )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: "Trending Deals"
                  .text
                  // .textStyle(GoogleFonts.nunito())
                  .bold
                  .xl4
                  .make()),
          // InkWell(
          //     onTap: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => SearchPage()));
          //     },
          //     child: SearchButton())
        ],
      ),
    );
  }
}
