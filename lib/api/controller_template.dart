import "dart:convert";
import "package:http/http.dart" as http;
import "package:music_store/api/compact_disc.dart";
import "package:music_store/global_data/global_data.dart";

var endpointData = GlobalData().formValues;
String baseUrl = "http://"+endpointData["address"]+":"+endpointData["port"]+"/api/";
class BaseClient {
  var client = http.Client();

  //headers
  Map<String, String> headers = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*'
  };

  //method to test the defined endpoints are correct
  Future<int?> testApi(String api)async
  {
    var url = Uri.parse("http://"+api);
    var response = null;

    try
    {
      response = await client.get(url, headers: headers);
      return response.statusCode;
    }
    catch(e)
    {
      return null;
    }

  }

  // retrieves data
  Future<dynamic> get(String api) async
  {
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      print(response);
    }
  }

  // add new data
  Future<dynamic> post(String api, dynamic object) async
  {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var response = await client.post(url, headers: headers, body: payload);
    if (response.statusCode == 201) {
      return json.decode(response.body);
    }
    else {
      print(response.body);
    }
    print(response.body);
  }

  // updates a content
  Future<dynamic> put(String api, dynamic object) async
  {
    var url = Uri.parse(baseUrl + api);
    var payload = json.encode(object);
    var response = await client.put(url, headers: headers, body: payload);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      print(response.body);
    }
    print(response.body);
  }

  //delete
  Future<dynamic> delete(String api) async
  {
    var url = Uri.parse(baseUrl + api);
    var response = await client.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      print(response);
    }
  }
}