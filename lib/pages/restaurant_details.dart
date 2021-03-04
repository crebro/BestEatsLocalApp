import 'dart:ui';
import 'package:BestEatsLocal/models/coupon.dart';
import 'package:BestEatsLocal/models/restaurant.dart';
import 'package:BestEatsLocal/pages/auth/authenticate.dart';
import 'package:BestEatsLocal/pages/auth/login.dart';
import 'package:BestEatsLocal/providers/userProvider.dart';
import 'package:BestEatsLocal/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:BestEatsLocal/components/plain_button.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantDetails extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantDetails({@required this.restaurant});

  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  ApiService apiService = ApiService();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<ApiCoupon> coupons = [];

  @override
  void initState() {
    super.initState();
    getCoupons();
  }

  void getCoupons() async {
    List<ApiCoupon> responseCoupons =
        await apiService.getCouponsFromRetaurant(widget.restaurant.id);
    print(responseCoupons);
    setState(() {
      this.coupons = responseCoupons;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Row(
                    children: [
                      Expanded(
                          child: Image.network(
                        widget.restaurant.imageLocation,
                        fit: BoxFit.cover,
                      )),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ]),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      widget.restaurant.name
                          .toString()
                          .text
                          .xl4
                          .bold
                          .textStyle(GoogleFonts.nunito())
                          .make(),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Couopns from ${widget.restaurant.name}",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: GoogleFonts.nunito().fontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: this.coupons.length,
                        itemBuilder: (context, index) {
                          ApiCoupon coupon = this.coupons[index];
                          return Builder(
                            builder: (context) {
                              return Card(
                                child: ListTile(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Redeem a Coupon',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            content: Container(
                                              child: Text(coupon.value),
                                              height: 100,
                                              width: 200,
                                            ),
                                            actions: [
                                              userProvider.user != null
                                                  ? PlainButton(
                                                      icon: Icons.redeem,
                                                      value: "Redeem",
                                                      onTap: () async {
                                                        bool isSuccess =
                                                            await userProvider
                                                                .redeemCoupon(
                                                                    couponId:
                                                                        coupon
                                                                            .id);
                                                        Navigator.pop(context);
                                                        if (isSuccess) {
                                                          _scaffoldKey
                                                              .currentState
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: Text(
                                                              'Successfully Created Coupon',
                                                            ),
                                                          ));
                                                        } else {
                                                          _scaffoldKey
                                                              .currentState
                                                              .showSnackBar(
                                                                  SnackBar(
                                                            content: Text(
                                                              'Already Redeemed the Same Coupon',
                                                            ),
                                                          ));
                                                        }
                                                      },
                                                    )
                                                  : PlainButton(
                                                      icon: Icons.lock_rounded,
                                                      value: "Login to Redeem",
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Authenticate(
                                                                        showLogin:
                                                                            true)));
                                                      },
                                                    )
                                            ],
                                          );
                                        });
                                  },
                                  trailing: Icon(
                                    Icons.arrow_right,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  title: Text(coupon.value,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily:
                                              GoogleFonts.nunito().fontFamily,
                                          fontWeight: FontWeight.bold)),
                                ),
                              );
                            },
                          );
                          ;
                        }))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    "Redeem"
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
      )),
    );
  }
}
