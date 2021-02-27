import 'dart:ui';
import 'package:BestEatsLocal/models/coupon.dart';
import 'package:BestEatsLocal/models/restaurant.dart';
import 'package:BestEatsLocal/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantDetails extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantDetails({@required this.restaurant});

  @override
  _RestaurantDetailsState createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  ApiService apiService = ApiService();
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
    return Scaffold(
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
                          return Card(
                            child: ListTile(
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
