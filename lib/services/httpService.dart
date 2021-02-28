import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HttpService {
  String requestLocation;
  HttpService({this.requestLocation});

  Future<http.Response> getRequest(Map params) async {
    String location = addGetParams(params);
    http.Response response = await http.get(location);
    return response;
  }

  Future<http.StreamedResponse> postRequest(Map params,
      {Map<String, String> data, Map<String, String> headers}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(this.requestLocation + "?apiKey=8865732618"));
    print(this.requestLocation + "?apiKey=8865732618");
    request.fields.addAll(data);
    if (headers != null) {
      request.headers.addAll(headers);
    }
    http.StreamedResponse response = await request.send();
    return response;
  }

  Future<Response> postRequestWithImage(Map params,
      {Map<String, String> data,
      String imagePath,
      String imageKey,
      String filename}) async {
    String location = this.requestLocation + "?apiKey=8865732618";
    Map<String, dynamic> requestData = {
      imageKey: await MultipartFile.fromFile(
        imagePath,
      ),
    };
    requestData.addAll(data);
    FormData formData = FormData.fromMap(requestData);
    Dio dio = new Dio();
    try {
      Response response = await dio.post(location, data: formData);
      return response;
    } catch (e) {
      print("There was an Error ${e.toString()}");
      return null;
    }
  }

  String addGetParams(Map params) {
    String locationwithparams = this.requestLocation + "?";
    int i = 0;
    params.forEach((key, value) {
      locationwithparams =
          "$locationwithparams${i == 0 ? '?' : '&'}$key=$value";
      i++;
    });
    return locationwithparams;
  }
}
