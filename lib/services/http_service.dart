import 'dart:convert';
import 'package:http/http.dart';
import '../models/post_model.dart';

class Network {
  static String BASE = "630c43f383986f74a7bc1535.mockapi.io";
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  /* Http Apis */
  static String API_LIST = "/contacts";
  static String API_CREATE = "/contacts";
  static String API_UPDATE = "/contacts/"; //{id}
  static String API_DELETE = "/contacts/"; //{id}

  /* Http Requests */
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'fullname': post.fullname,
      'mobile': post.mobile,
    });
    return params;
  }

  static Map<String, dynamic> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'id': post.id.toString(),
      'fullname': post.fullname,
      'mobile': post.mobile,
    });
    return params;
  }

  /* Http Parsing */
  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }

}