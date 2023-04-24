// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'package:http_interceptor/extensions/extensions.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

abstract class IHttpClient {
  Future<Response> get(String? endpoint, {Map<String, dynamic>? headers});
}

class HttpClient extends IHttpClient implements InterceptorContract {
  late InterceptedHttp _client;

  HttpClient() {
    _client = InterceptedHttp.build(interceptors: [this]);
  }

  @override
  Future<Response> get(String? endpoint,
      {Map<String, dynamic>? headers}) async {
    final response = await _client
        .get(endpoint!.toUri(), headers: {'Content-Type': 'application/json'});

    return response;
  }

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.headers['Content-Type'] = 'application/json';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response ${data.url}');
    print('Response ${data.statusCode}');
    print('Response ${data.headers}');
    print('Response ${data.body}');

    return data;
  }
}
