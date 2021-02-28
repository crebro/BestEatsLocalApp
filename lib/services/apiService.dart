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
        (await httpService.getRequest(_requestGetParams())).body)['data'];
    List<ApiCoupon> responseCoupons = response.map((coupon) {
      return ApiCoupon(
          value: coupon['display_text'], description: coupon['description']);
    }).toList();
    return responseCoupons;
  }

  Future<List> getRestaurants() async {
    HttpService httpService =
        HttpService(requestLocation: requestLocations['GET_ALL_RESTUARANTS']);
    List<dynamic> response = jsonDecode(
        (await httpService.getRequest(_requestGetParams())).body)['data'];
    List<Restaurant> responseRestaurants = response.map((restaurant) {
      return Restaurant.fromMap(restaurant);
    }).toList();
    return responseRestaurants;
  }

  Future<List> getCouponsFromRetaurant(int restaurantId) async {
    HttpService httpService = HttpService(
        requestLocation: _getRestaurantCouponsEndpoint(restaurantId));
    List<dynamic> response = jsonDecode(
        (await httpService.getRequest(_requestGetParams())).body)['data'];
    List<ApiCoupon> responseCouopns = response.map((coupon) {
      return ApiCoupon.fromMap(coupon);
    }).toList();
    return responseCouopns;
  }

  Future<Map> login(String email, String password) async {
    HttpService httpService =
        HttpService(requestLocation: requestLocations['AUTHENTICATE_LOGIN']);
    Map<String, String> data = {
      "email": email,
      "password": password,
      "device_name": "android",
    };
    var response =
        await httpService.postRequest(_requestGetParams(), data: data);
    try {
      Map responseData =
          jsonDecode(await response.stream.bytesToString())['data'];
      return responseData;
    } catch (e) {
      return null;
    }
  }

  Future<Map> register({String name, String email, String password}) async {
    HttpService httpService =
        HttpService(requestLocation: requestLocations['AUTHENTICATE_REGISTER']);
    Map<String, String> data = {
      "email": email,
      "password": password,
      "name": name,
    };
    var response =
        await httpService.postRequest(_requestGetParams(), data: data);
    try {
      Map responseData =
          jsonDecode(await response.stream.bytesToString())['data'];
      return responseData;
    } catch (e) {
      return null;
    }
  }

  Future<Map> warmUser(String token) async {
    HttpService httpService =
        HttpService(requestLocation: requestLocations['AUTHENTICATE_TOKEN']);
    Map<String, String> data = {
      "token": token,
    };
    var response =
        await httpService.postRequest(_requestGetParams(), data: data);
    try {
      Map responseData =
          jsonDecode(await response.stream.bytesToString())['data'];
      return responseData;
    } catch (e) {
      return null;
    }
  }

  Future<Map> redeemCoupon(String token, {int userId, int couponId}) async {
    HttpService httpService =
        HttpService(requestLocation: requestLocations['REDEEM_COUPON']);
    Map<String, String> data = {
      "user_id": userId.toString(),
      "coupon_id": couponId.toString(),
    };
    Map<String, String> headers = {
      "verify-token": token,
    };
    var response = await httpService.postRequest(_requestGetParams(),
        data: data, headers: headers);
    try {
      Map responseData = jsonDecode(await response.stream.bytesToString());
      return responseData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Map _requestGetParams() {
    return {"apiKey": apiKey};
  }

  String _getRestaurantCouponsEndpoint(int restaurantId) {
    return "$baseURL/restaurants/$restaurantId/coupons";
  }
}
