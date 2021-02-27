import 'package:BestEatsLocal/models/coupon.dart';

class Restaurant {
  String name;
  String imageLocation;
  String phone;
  String email;
  String website;
  ApiCoupon coupon;
  bool hasCoupon = true;
  int id;
  Restaurant.fromMap(Map map) {
    this.name = map['name'];
    this.imageLocation = map['image'];
    this.phone = map['phone'];
    this.email = map['email'];
    this.website = map['website'];
    this.id = map['id'];
    if (!map['coupon'].isEmpty) {
      this.coupon = ApiCoupon.fromMap(map['coupon']);
    } else {
      this.hasCoupon = false;
    }
  }
}
