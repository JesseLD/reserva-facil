import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: _getBaseURL(),
            connectTimeout: const Duration(milliseconds: 30000),
            receiveTimeout: const Duration(milliseconds: 30000),
            headers: _getHeaders(),
          ),
        ) {
    // _dio.interceptors.add(LogInterceptor(responseBody: true));
    // _disableSSLCertificateVerification();
  }

  static _getHeaders() {
    return {
      'Authorization': _getApiKey(),
      'Content-Type': 'application/json',
    };
  }

  static _getBaseURL() {
    // Change the return value to the URL of your API

    // return "http://172.20.73.96:3000/"; // URL Casa
    return "https://api.reservafacil.site/"; // URL Produção
  }

  static _getApiKey() {
    return "MDA_APP2";
  }

  Dio get dio => _dio;

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      log("Erro ocorrido: $e");
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      log("Erro ocorrido: $e");
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } catch (e) {
      log("Erro ocorrido: $e");
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> delete(String path, {dynamic data}) async {
    try {
      return await _dio.delete(path, data: data);
    } catch (e) {
      log("Erro ocorrido: $e");
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(Object error) {
    if (error is DioException) {
      log(
          'DioError: ${error.response?.statusCode} - ${error.response?.data}');
    } else {
      log('Error: $error');
    }
  }

}
