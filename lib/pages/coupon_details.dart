import 'dart:ui';

import 'package:BestEatsLocal/models/coupon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class CouponDetails extends StatelessWidget {
  final ApiCoupon apiCoupon;
  CouponDetails({@required this.apiCoupon});

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
                        apiCoupon.restaurant.imageLocation,
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
                      apiCoupon.value
                          .toString()
                          .text
                          .xl4
                          .bold
                          .textStyle(GoogleFonts.nunito())
                          .make(),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("More from ${apiCoupon.restaurant.name}",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: GoogleFonts.nunito().fontFamily,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         children: [
  //           Expanded(
  //               child: Image.network(
  //             apiCoupon.restaurant.imageLocation,
  //             fit: BoxFit.cover,
  //           )),
  //           Expanded(
  //               flex: 4,
  //               child: Container(
  //                 child: SingleChildScrollView(
  //                     child: Column(
  //                   children: [
  //                     Expanded(
  //                       child: apiCoupon.value
  //                           .toString()
  //                           .text
  //                           .xl4
  //                           .bold
  //                           .textStyle(GoogleFonts.nunito())
  //                           .make(),
  //                     ),
  //                     Container(
  //                       alignment: Alignment.centerLeft,
  //                       margin: EdgeInsets.symmetric(horizontal: 10),
  //                       child: Text(apiCoupon.restaurant.name,
  //                           style: TextStyle(
  //                               fontFamily: GoogleFonts.nunito().fontFamily,
  //                               fontWeight: FontWeight.bold)),
  //                     ),
  //                     // Html(
  //                     //   data: !showMore
  //                     //       ? widget.property.description.length > 200
  //                     //           ? widget.property.description
  //                     //                   .substring(0, 200) +
  //                     //               "...."
  //                     //           : widget.property.description
  //                     //       : widget.property.description,
  //                     //   style: {
  //                     //     "*": Style(
  //                     //         fontFamily: GoogleFonts.nunito().fontFamily,
  //                     //         fontWeight: FontWeight.bold,
  //                     //         fontSize: FontSize.large)
  //                     //   },
  //                     // ),
  //                     // if (widget.property.description.length > 200)
  //                     //   Container(
  //                     //     margin: EdgeInsets.only(left: 20, bottom: 20),
  //                     //     child: Align(
  //                     //       alignment: Alignment.centerLeft,
  //                     //       child: GestureDetector(
  //                     //         onTap: () {
  //                     //           setState(() {
  //                     //             showMore = !showMore;
  //                     //           });
  //                     //         },
  //                     //         child: Text(
  //                     //           showMore ? "Show Less" : "Show More",
  //                     //           style: TextStyle(color: Colors.blue[700]),
  //                     //         ),
  //                     //       ),
  //                     //     ),
  //                     //   ),
  //                     // SizedBox(
  //                     //   height: 300,
  //                     //   width: width,
  //                     //   child: MapView(
  //                     //     latitude: double.parse(widget.property.latitude),
  //                     //     longitude: double.parse(widget.property.longitude),
  //                     //   ),
  //                     // )
  //                   ],
  //                 )),
  //               )),
  //           // FlatButton(
  //           //     padding: EdgeInsets.symmetric(vertical: 7),
  //           //     onPressed: () async {
  //           //       String url = 'tel:$samsCallNo';
  //           //       if (await canLaunch(url)) {
  //           //         await launch(url);
  //           //       }
  //           //     },
  //           //     child: Column(
  //           //       children: [
  //           //         "Interested ?"
  //           //             .text
  //           //             .fontFamily(GoogleFonts.nunito().fontFamily)
  //           //             .bold
  //           //             .xl
  //           //             .make(),
  //           //         Row(
  //           //           mainAxisAlignment: MainAxisAlignment.center,
  //           //           children: [
  //           //             Icon(
  //           //               Icons.phone,
  //           //               size: 30,
  //           //             ),
  //           //             SizedBox(
  //           //               width: 10,
  //           //             ),
  //           //             "$samsCallNo"
  //           //                 .text
  //           //                 .fontFamily(GoogleFonts.nunito().fontFamily)
  //           //                 .bold
  //           //                 .xl2
  //           //                 .make(),
  //           //           ],
  //           //         ),
  //           //       ],
  //           //     ))
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
