import 'package:BestEatsLocal/components/all_coupons.dart';
import 'package:BestEatsLocal/components/appbar.dart';
import 'package:BestEatsLocal/components/appdrawer.dart';
import 'package:BestEatsLocal/components/plain_button.dart';
import 'package:BestEatsLocal/pages/auth/authenticate.dart';
import 'package:BestEatsLocal/pages/auth/login.dart';
import 'package:BestEatsLocal/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        drawer: ApplicationDrawer(),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ApplicationBar(),
              AllCoupons(),
              userProvider.user == null
                  ? PlainButton(
                      icon: Icons.redeem,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Authenticate(
                                      showLogin: true,
                                    )));
                      },
                      value: "Login to Start Saving",
                    )
                  : PlainButton(
                      icon: Icons.logout,
                      onTap: () {
                        userProvider.logout();
                      },
                      value: "Logout",
                    )
            ],
          ),
        ));
  }
}
