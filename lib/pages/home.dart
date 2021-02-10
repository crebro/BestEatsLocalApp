import 'package:BestEatsLocal/components/all_coupons.dart';
import 'package:BestEatsLocal/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ApplicationBar(),
          AllCoupons(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: FlatButton(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 7),
                onPressed: () async {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.redeem,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    "Login to Start Saving"
                        .text
                        .fontFamily(GoogleFonts.nunito().fontFamily)
                        .bold
                        .white
                        .xl2
                        .make(),
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
