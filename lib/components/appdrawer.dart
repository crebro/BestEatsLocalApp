import 'package:BestEatsLocal/pages/auth/authenticate.dart';
import 'package:BestEatsLocal/pages/user_coupons.dart';
import 'package:flutter/material.dart';
import 'package:BestEatsLocal/providers/userProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';

class ApplicationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    Map user = userProvider.user;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter:
                          new ColorFilter.mode(Colors.grey, BlendMode.modulate),
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/12/08/00/26/food-1081707_960_720.jpg",
                      ))),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child:
                      "Welcome, ${user != null ? user['name'] : 'Guest User'} "
                          .text
                          .xl3
                          .fontFamily(GoogleFonts.nunito().fontFamily)
                          .bold
                          .white
                          .make())),
          (userProvider.user == null)
              ? Column(
                  children: [
                    getDrawerItem("Login", Icons.person, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Authenticate(showLogin: true)));
                    }),
                    getDrawerItem("Register", Icons.person_add_alt, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Authenticate(showLogin: false)));
                    }),
                  ],
                )
              : Column(
                  children: [
                    getDrawerItem("Logout", Icons.exit_to_app, () async {
                      await userProvider.logout();
                    }),
                    getDrawerItem("Your Coupons", Icons.redeem_rounded, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserCoupons()));
                    }),
                  ],
                )
        ],
      ),
    );
  }

  Widget getDrawerItem(String title, IconData icon, Function onTap) {
    return ListTile(
      onTap: () => onTap(),
      leading: Icon(
        icon,
        color: Colors.black,
        size: 30,
      ),
      title: title.text.xl2
          .fontFamily(GoogleFonts.nunito().fontFamily)
          .bold
          .make(),
    );
  }
}
