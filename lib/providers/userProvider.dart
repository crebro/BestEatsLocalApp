import 'package:BestEatsLocal/services/apiService.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  Map _user;

  Map get user => _user;

  Future<bool> loginUser(String email, String password) async {
    ApiService apiService = ApiService();
    Map response = await apiService.login(email, password);
    if (response != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      this._user = response;
      prefs.setString('token', response['token']);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<void> getWarmUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") != null) {
      ApiService apiService = ApiService();
      Map response = await apiService.warmUser(prefs.getString("token"));
      this._user = response;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    this._user = null;
    notifyListeners();
  }

  Future<bool> registerUser(
      {String name, String email, String password}) async {
    ApiService apiService = ApiService();
    Map response =
        await apiService.register(name: name, email: email, password: password);
    if (response != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      this._user = response;
      prefs.setString('token', response['token']);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> redeemCoupon({int couponId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("token") != null) {
      ApiService apiService = ApiService();
      Map response = await apiService.redeemCoupon(prefs.getString("token"),
          couponId: couponId, userId: _user['id']);
      // Returning true if message_code is success, false if something else
      return response['message_code'] == "SUCCESS";
    }
    // Returning False Because the user is not logged in
    return false;
  }
}
