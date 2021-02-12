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

  Future<Map> login(String email, String password) async {
    HttpService httpService =
        HttpService(requestLocation: requestLocations['AUTHENTICATE_LOGIN']);
    Map<String, String> data = {
      "email": email,
      "password": password,
      "device_name": "android",
    };
    var response =
        await httpService.postRequest(requestGetParams(), data: data);
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
        await httpService.postRequest(requestGetParams(), data: data);
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
        await httpService.postRequest(requestGetParams(), data: data);
    try {
      Map responseData =
          jsonDecode(await response.stream.bytesToString())['data'];
      return responseData;
    } catch (e) {
      return null;
    }
  }

  Future<bool> registerRestaurant({
    String name,
    String phone,
    String email,
    String website,
    String imagePath,
  }) async {
    HttpService httpService =
        HttpService(requestLocation: requestLocations['RESOURCE_RESTAURANT']);
    Map<String, String> data = {
      "name": name,
      "phone": phone,
      "email": email,
      "website": website,
    };
    var response = await httpService.postRequestWithImage(requestGetParams(),
        data: data,
        imageKey: "image",
        imagePath: imagePath,
        filename: imagePath.split('/').last);
    print(response.toString());
    try {
      Map responseData = jsonDecode(response.toString())['data'];
      print(responseData);
      return true;
    } catch (e) {
      return null;
    }
  }

  Map requestGetParams() {
    return {"apiKey": apiKey};
  }
}
