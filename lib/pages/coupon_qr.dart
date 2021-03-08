import 'package:BestEatsLocal/models/userCoupons.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CouponQrPage extends StatelessWidget {
  final UserCoupon userCoupon;
  const CouponQrPage({Key key, @required this.userCoupon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        QrImage(
                          data: this.userCoupon.useToken,
                          size: 180,
                        ),
                        Text(
                          "Show this QR code to the Respective Restaurant to use this Coupon.",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Coupon By",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              userCoupon.restaurantImage,
                              height: 45,
                              width: 90,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
