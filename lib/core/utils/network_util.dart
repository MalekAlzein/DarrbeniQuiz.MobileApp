import 'dart:convert';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static String baseUrl = 'training.owner-tech.com';
  static var client = http.Client();
  static Future<dynamic> sendRequest({
    required RequestType type,
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    try {
      //!--- Required for request ----
      //*--- Make full api url ------
      var uri = Uri.https(baseUrl, url, params);

      //?--- To Save api response ----
      late http.Response response;
      //?--- To Save api status code ----
      int statusCode = 0;

      //!--- Required convert api response to Map ----

      Map<String, dynamic> jsonResponse = {};

      //*--- Make call correct request type ------

      switch (type) {
        case RequestType.GET:
          response = await client.get(uri, headers: headers);

          break;
        case RequestType.POST:
          response =
              await client.post(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.PUT:
          response =
              await client.put(uri, body: jsonEncode(body), headers: headers);
          break;
        case RequestType.DELETE:
          response = await client.delete(uri,
              body: jsonEncode(body), headers: headers);
          break;
        case RequestType.MULTIPART:
          break;
      }
      dynamic result;
      try {
        result = jsonDecode(Utf8Codec().decode(response.bodyBytes));
      } catch (e) {
        print(e);
      }

      statusCode = response.statusCode;
      jsonResponse.putIfAbsent(
          'response',
          () => result == null
              ? {'title': Utf8Codec().decode(response.bodyBytes)}
              : result); //string json

      jsonResponse.putIfAbsent('statusCode', () => statusCode);

      return jsonResponse;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> SendMultipartRequest({
    required String url,
    required RequestType requestType,
    Map<String, String>? headers = const {},
    Map<String, String>? fields = const {},
    Map<String, String>? files = const {},
    Map<String, dynamic>? params,
  }) async {
// assert(
//       requestType == RequestType.GET || requestType == RequestType.MULTIPART,
//       'Focus pls');

    try {
      var request = http.MultipartRequest(
          requestType.name, Uri.https(baseUrl, url, params));
      var _filesKeyList = files!.keys.toList();
      var _filesNameList = files.values.toList();

      for (int i = 0; i < _filesKeyList.length; i++) {
        if (_filesNameList[i].isNotEmpty) {
          var multipartFile = http.MultipartFile.fromPath(
            _filesKeyList[i],
            _filesNameList[i],
            filename: path.basename(_filesNameList[i]),
            contentType: getContentType(_filesNameList[i]),
          );
          request.files.add(await multipartFile);
        }
      }
      request.headers.addAll(headers!);

      request.fields.addAll(fields!);

      var response = await request.send();

      Map<String, dynamic> responseJson = {};
      dynamic value;
      try {
        value = await response.stream.bytesToString();
      } catch (e) {}

      responseJson.putIfAbsent('statusCode', () => response.statusCode);
      responseJson.putIfAbsent('response',
          () => value.isNotEmpty ? jsonDecode(value) : {'title': value});

      return responseJson;
    } catch (error) {
      CustomToast.showMessage(message: error.toString());
    }
  }

  // static MediaType getContentType(String name) {
  //   var ext = name.split('.').last;
  //   if (ext == "png" || ext == "jpeg") {
  //     return MediaType.parse("image/jpg");
  //   } else if (ext == 'pdf') {
  //     return MediaType.parse("application/pdf");
  //   } else {
  //     return MediaType.parse("image/jpg");
  //   }
  static MediaType getContentType(String name) {
    var ext = name.split('.').last;
    if (ext == ("png") || ext == ("jpeg") || ext == ("jpg")) {
      return MediaType.parse("image/jpeg");
    } else if (ext == ("bmp")) {
      return MediaType.parse('image/bmp');
    } else if (ext == ("gif")) {
      return MediaType.parse('image/gif');
    } else if (ext == ("webp")) {
      return MediaType.parse("image/webp");
    } else if (ext == ("ico")) {
      return MediaType.parse("image/x-icon");
    } else if (ext == ("flv")) {
      return MediaType.parse("video/x-flv");
    } else if (ext == ("wmv")) {
      return MediaType.parse("video/x-ms-wmv'");
    }
    if (ext == ("ppt") || ext == ("pptx")) {
      return MediaType.parse("application/vnd.ms-powerpoint");
    }
    if (ext == ("xls") || ext == ("xlsx")) {
      return MediaType.parse("application/vnd.ms-excel");
    }
    if (ext == ("doc") || ext == ("docx")) {
      return MediaType.parse("application/msword");
    } else if (ext == ("mp4") || ext == ("avi") || ext == ("mov")) {
      return MediaType.parse("video/mp4");
    } else if (ext == ("ogg")) {
      return MediaType.parse("audio/ogg");
    } else if (ext == ("aac")) {
      return MediaType.parse("audio/aac");
    } else if (ext == ("wav")) {
      return MediaType.parse("audio/wav");
    } else if (ext == ("mp3")) {
      return MediaType.parse("audio/mpeg");
    } else if (ext == ("pdf")) {
      return MediaType.parse("application/pdf");
    } else if (ext == ("txt") || ext == ("md")) {
      return MediaType.parse("text/plain");
    } else if (ext == ("html") || ext == ("htm")) {
      return MediaType.parse("text/html");
    } else if (ext == ("xml")) {
      return MediaType.parse("application/xml");
    } else if (ext == ("json")) {
      return MediaType.parse("application/json");
    } else if (ext == ("csv")) {
      return MediaType.parse("text/csv");
    } else {
      return MediaType.parse("application/octet-stream");
    }
  }
}





  // void test() async {
  //   var response = await client.post(Uri.https(baseUrl, 'api/web/user/login'),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode(
  //           {"userName": "Test@gmail.com", "password": "Test@1234"}));

  //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  // }
// }
