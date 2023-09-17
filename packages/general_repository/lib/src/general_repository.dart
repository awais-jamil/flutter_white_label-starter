import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import '../general_repository.dart';
import 'package:http/http.dart' as http;

/// General Repository to interact with any REST API
class GeneralRepository {
  GeneralRepository({
    http.Client? client,
  }) : _client = client ?? http.Client();

  final http.Client _client;
  static String? token;

  /// Header with [JWT] token
  Map<String, String>? get headerWithToken => {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer ${token ?? "U2FsdGVkX1+8gP7UJQ1vfvQ+21fNBTdCd6MA48am7Zme+E09HVW8EfW7R8IJXjNcnnHZXD7jOqT/J/Mg4dId4FhtivwNJefudJa1ZxRI6Zd4k4OuLOCCqzlLP9jQZ+74hFDbEWwQOUsS75sFdiSuZo/+FmBp9s1UKppf0v8nuAw7nkcUbMABt5brgcqb82i4"}",
      };

  /// Used to initiate a [GET] request
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<Map<String, dynamic>> get({
    required String handle,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header0 = header ?? headerWithToken;

    // final timeout to be used with request
    final timeOut0 = timeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header0)}',
        name: 'package.bloc_rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    Map<String, dynamic> responseJson = {};
    try {
      rawResponse = await _client
          .get(
            uri,
            headers: header0,
          )
          .timeout(timeOut0);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } on Exception {
      throw const MissingDataException();
    } finally {
      if (responseJson == {}) {
        throw const MissingDataException();
      }
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.bloc_rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to initiate a [POST] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<Map<String, dynamic>?> post({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header0 = header ?? headerWithToken;

    // final timeout to be used with request
    final timeOut0 = timeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header0)}',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Body: $body',
        name: 'package.bloc_rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    Map<String, dynamic> responseJson = {};
    try {
      rawResponse = await _client
          .post(
            uri,
            body: jsonEncode(body),
            headers: header0,
          )
          .timeout(timeOut0);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.bloc_rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to initiate a [POST] multipart request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<Map<String, dynamic>?> postMultipart({
    required String handle,
    required String fileField,
    required List<String> files,
    Map<String, String>? body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header0 = header ?? headerWithToken;

    // final timeout to be used with request
    final timeOut0 = timeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header0)}',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Body: $body',
        name: 'package.bloc_rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    Map<String, dynamic> responseJson = {};
    try {
      final request = http.MultipartRequest("POST", uri);

      request.headers.addAll(header0 ?? {});

      if (body != null) request.fields.addAll(body);

      final List<http.MultipartFile> filePaths = [];

      for (int i = 0; i < files.length; i++) {
        final file = await http.MultipartFile.fromPath(
          fileField,
          files[i],
          filename: 'complainImage$i.jpg',
        );
        filePaths.add(file);
      }

      request.files.addAll(filePaths);

      final multipartResponse = await request.send().timeout(timeOut0);

      rawResponse = await http.Response.fromStream(multipartResponse);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.bloc_rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to initiate a [PATCH] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<Map<String, dynamic>?> patch({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header0 = header ?? headerWithToken;

    // final timeout to be used with request
    final timeOut0 = timeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header0)}',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Body: $body',
        name: 'package.bloc_rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    Map<String, dynamic> responseJson = {};
    try {
      rawResponse = await _client
          .patch(
            uri,
            body: jsonEncode(body),
            headers: header0,
          )
          .timeout(timeOut0);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.bloc_rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to initiate a [DELETE] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<Map<String, dynamic>?> delete({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header0 = header ?? headerWithToken;

    // final timeout to be used with request
    final timeOut0 = timeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header0)}',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Body: $body',
        name: 'package.bloc_rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    Map<String, dynamic> responseJson = {};
    try {
      rawResponse = await _client
          .delete(
            uri,
            body: body != null ? jsonEncode(body) : null,
            headers: header0,
          )
          .timeout(timeOut0);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.bloc_rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }

    return responseJson;
  }

  /// Used to initiate a [PUT] request
  ///
  /// Use the [body] parameter to send the json data to the service
  ///
  /// The [handle] is end point that will be attached to the [baseUrl]
  /// which either can be provided as a whole using the [APIConfig]
  /// setting or can be overidden as it is given as an option parameter
  /// in the function.
  ///
  /// Same thing applies for the [header] parameter
  Future<Map<String, dynamic>?> put({
    required String handle,
    dynamic body,
    String? baseUrl,
    Map<String, String>? header,
    Duration? timeOut,
    bool enableLogs = false,
  }) async {
    // final url to which call will be made
    final url = (baseUrl ?? APIConfig.baseUrl) + handle;

    // uri to be passed to request
    final uri = Uri.parse(url);

    // final header which will be used to make call
    final header0 = header ?? headerWithToken;

    // final timeout to be used with request
    final timeOut0 = timeOut ?? APIConfig.responseTimeOut;

    if (enableLogs) {
      log(
        'Request URl: $url',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Header: ${jsonEncode(header0)}',
        name: 'package.bloc_rest_api.$handle',
      );
      log(
        'Request Body: $body',
        name: 'package.bloc_rest_api.$handle',
      );
    }

    http.Response? rawResponse;
    Map<String, dynamic> responseJson = {};
    try {
      rawResponse = await _client
          .put(
            uri,
            body: body != null ? jsonEncode(body) : null,
            headers: header0,
          )
          .timeout(timeOut0);
      responseJson = await _response(rawResponse);
    } on SocketException {
      throw const FetchDataException();
    } on TimeoutException {
      throw const TimeOutExceptionC();
    } finally {
      if (enableLogs) {
        log(
          'Request Response Status: ${rawResponse?.statusCode}',
          name: 'package.bloc_rest_api.$handle',
        );
        log(
          'Request Raw Response: ${rawResponse?.body}',
          name: 'package.bloc_rest_api.$handle',
        );
      }
    }
    if (responseJson["data"] != null) {
      return responseJson["data"] as Map<String, dynamic>;
    } else {
      return responseJson;
    }
  }

  /// Used to convert a locally provided [json] String to json Map
  Future<Map<String, dynamic>?> local(
    String json, {
    bool enableLogs = false,
  }) async {
    if (enableLogs) {
      log(
        'JSON String: $json',
        name: 'package.bloc_rest_api.local',
      );
    }

    late final Map<String, dynamic> rawResponse;
    try {
      rawResponse = jsonDecode(json) as Map<String, dynamic>;
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      if (enableLogs) {
        log(
          'Raw JSON: $rawResponse',
          name: 'package.bloc_rest_api.local',
        );
      }
    }
    return rawResponse;
  }

  /// General HTTP code responses
  Future<Map<String, dynamic>> _response(http.Response response) async {
    switch (response.statusCode) {
      case 200:
      case 201:
        final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
        if ((responseJson["status"] as int) == 0) {
          throw APIException(responseJson["message"] as String?);
        }
        return responseJson;
      case 400:
      case 422:
        throw BadRequestException(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]
              as String?,
        );
      case 401:
      case 403:
        throw UnauthorizedException(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]
              .toString(),
        );
      case 404:
        throw NotFoundException(
          (jsonDecode(response.body) as Map<String, dynamic>)["message"]
              .toString(),
        );
      case 500:
      default:
        throw FetchDataException(
          'Something went wrong, please try again later.\n\nStatus Code : ${response.statusCode}',
        );
    }
  }
}
