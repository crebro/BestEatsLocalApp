import 'package:BestEatsLocal/components/all_coupons.dart';
import 'package:BestEatsLocal/components/appbar.dart';
import 'package:BestEatsLocal/components/plain_button.dart';
import 'package:BestEatsLocal/pages/auth/login.dart';
import 'package:flutter/material.dart';

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
          PlainButton(
            icon: Icons.redeem,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            value: "Login to Start Saving",
          )
        ],
      ),
    ));
  }
}
