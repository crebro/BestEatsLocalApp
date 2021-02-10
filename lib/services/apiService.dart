import 'dart:convert';
import 'package:BestEatsLocal/models/coupon.dart';
import 'package:BestEatsLocal/constants/apiConstants.dart';
import 'package:BestEatsLocal/models/restaurant.dart';
import 'package:BestEatsLocal/services/httpService.dart';

class ApiService {
  Future<List> getCoupons() async {
    HttpService httpService =
        HttpService(requestLocation: requestLocations['GET_ALL_COUPONS']);
    List<dynamic> response = jsonDecode(
        (await httpService.getRequest(requestGetParams())).body)['data'];
    List<ApiCoupon> responseCoupons = response.map((coupon) {
      return ApiCoupon(
          value: coupon['value'],
          restaurant: Restaurant.fromMap(coupon['restaurant']));
    }).toList();
    return responseCoupons;
  }

  Future<dynamic> login(String email, String password) async {
    HttpService httpService =
        HttpService(requestLocation: requestLocations['AUTHENTICATE_LOGIN']);
    Map<String, String> data = {
      "email": email,
      "password": password,
      "device_name": "android",
    };
    var response =
        await httpService.postRequest(requestGetParams(), data: data);
    print(await response.stream.bytesToString());
  }

  Map requestGetParams() {
    return {"apiKey": apiKey};
  }

  Map loginParams(String email, String password) {
    return {"apiKey": apiKey, "email": email, "password": password};
  }
}
