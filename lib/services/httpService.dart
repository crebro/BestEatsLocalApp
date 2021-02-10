import 'package:http/http.dart' as http;

class HttpService {
  String requestLocation;
  HttpService({this.requestLocation});

  Future<http.Response> getRequest(Map params) async {
    String location = addGetParams(params);
    http.Response response = await http.get(location);
    return response;
  }

  Future<http.StreamedResponse> postRequest(Map params,
      {Map<String, String> data}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(this.requestLocation + "?apiKey=8865732618"));
    print(this.requestLocation + "?apiKey=8865732618");
    request.fields.addAll(data);
    http.StreamedResponse response = await request.send();
    return response;
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
