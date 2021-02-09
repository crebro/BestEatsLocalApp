import 'package:BestEatsLocal/components/coupon.dart';
import 'package:BestEatsLocal/models/coupon.dart';
import 'package:BestEatsLocal/services/apiService.dart';
import 'package:flutter/material.dart';

class AllCoupons extends StatefulWidget {
  const AllCoupons({
    Key key,
  }) : super(key: key);

  @override
  _AllCouponsState createState() => _AllCouponsState();
}

class _AllCouponsState extends State<AllCoupons> {
  ApiService apiService = ApiService();
  List<ApiCoupon> coupons = [];

  @override
  void initState() {
    super.initState();
    getCoupons();
  }

  void getCoupons() async {
    List<ApiCoupon> responseCoupons = await apiService.getCoupons();
    setState(() {
      this.coupons = responseCoupons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
            childAspectRatio: 1 / 1.05,
            crossAxisCount: 2,
            children: coupons
                .map((coupon) => Coupon(
                      coupon: coupon,
                    ))
                .toList()));
  }
}
