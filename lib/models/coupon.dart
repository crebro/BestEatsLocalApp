import 'package:BestEatsLocal/models/restaurant.dart';

class ApiCoupon {
  String value;
  String description;
  Restaurant restaurant;
  ApiCoupon({this.value, this.description, this.restaurant});
  ApiCoupon.fromMap(Map map) {
    this.value = map['display_text'];
    this.description = map['description'];
  }
}
