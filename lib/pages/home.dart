import 'package:BestEatsLocal/components/all_coupons.dart';
import 'package:BestEatsLocal/components/appbar.dart';
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
        ],
      ),
    ));
  }
}
