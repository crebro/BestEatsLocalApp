import 'package:BestEatsLocal/models/userCoupons.dart';
import 'package:BestEatsLocal/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class UserCoupons extends StatefulWidget {
  @override
  _UserCouponsState createState() => _UserCouponsState();
}

class _UserCouponsState extends State<UserCoupons> {
  List<UserCoupon> userCoupons = [];

  @override
  void initState() {
    super.initState();
    getUserRedeemedCoupons();
  }

  void getUserRedeemedCoupons() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    List<UserCoupon> response = await userProvider.getCouponsRedeemedByUser();
    if (response != null) {
      setState(() {
        this.userCoupons = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: "Your Coupons"
                          .text
                          // .textStyle(GoogleFonts.nunito())
                          .bold
                          .xl4
                          .make()),
                ],
              ),
            ),
            Expanded(
                child: GridView.count(
                    childAspectRatio: 1 / 1.4,
                    crossAxisCount: 2,
                    children: userCoupons
                        .map(
                          (coupon) => VxBox(
                              child: Column(
                            children: [
                              Container(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: QrImage(
                                      data: coupon.useToken,
                                      size: 180,
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 180,
                                    child: getTruncatedTitle(coupon.value)
                                        .text
                                        .xl
                                        .maxLines(2)
                                        .overflow(TextOverflow.ellipsis)
                                        // .textStyle(GoogleFonts.robotoSlab())
                                        .bold
                                        .black
                                        .make(),
                                  ),
                                ],
                              ))
                            ],
                          )).padding(EdgeInsets.all(15)).neumorphic().make(),
                        )
                        .toList()))
          ],
        ),
      ),
    );
  }

  String getTruncatedTitle(String normal) {
    int limit = 47;
    if (normal.length > limit) {
      return normal + " .. ";
    }
    return normal;
  }
}
