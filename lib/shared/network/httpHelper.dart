import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:life_partner/shared/network/api.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future postData(
    {required String? pathUrl,
    required Map<String, dynamic>? body,
    token}) async {
  var client = http.Client();
  var url = Uri.parse('${AppApi.BaseUrl}$pathUrl');
  var res = await client.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      //  'Content-Type': 'application/json',
    },
    body: body,
  );

  if (res.statusCode == 200) {
    print(await res.body.toString());
    return jsonDecode(res.body.toString());
  } else {
    print(res.reasonPhrase);
  }
}

Future getData(
    {required String pathUrl, Map<String, dynamic>? query, token}) async {
  var client = http.Client();
  var url = Uri.parse('${AppApi.BaseUrl}$pathUrl');
  var res = await client.get(url, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  });
  print(res.body.toString());

  if (res.statusCode == 200) {
    print(await res.body.toString());
    return jsonDecode(res.body.toString());
  } else {
    print(res.reasonPhrase);
  }
}
