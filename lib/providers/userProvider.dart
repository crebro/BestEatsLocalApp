import 'package:BestEatsLocal/services/apiService.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  Map _user;

  Map get user => _user;

  Future<bool> loginUser(String email, String password) async {
    ApiService apiService = ApiService();
    Map response = await apiService.login(email, password);
    if (response != null) {
      this._user = response;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
