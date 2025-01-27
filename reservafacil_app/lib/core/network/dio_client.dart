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
    _dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        // Apenas continue com a resposta se for bem-sucedida
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        // Verifica se o erro está na faixa 400–499
        if (error.response != null &&
            error.response!.statusCode != null &&
            error.response!.statusCode! >= 400 &&
            error.response!.statusCode! < 500) {
          // Simplesmente trata o erro como uma resposta "normal"
          return handler.resolve(error.response!);
        }

        // Para outros erros (500+), deixe o Dio lançar a exceção
        return handler.next(error);
      },
    ));
    // _dio.interceptors.add(LogInterceptor(responseBody: true));
    // _disableSSLCertificateVerification();
  }

  static _getHeaders() {
    return {
      'Authorization': _getApiKey(),
      'Content-Type': 'application/json',
      'x-token': _getAuthToken(),

    };
  }

  static _getBaseURL() {
    // Change the return value to the URL of your API

    // return "http://localhost:3030/"; // URL Casa
    // return "http://192.168.1.232:3030/"; // URL Casa
    return "https://test-api.reservafacil.site/"; // URL Teste
    // return "http://172.20.73.96:3030/"; // URL Casa
    // return "https://api.reservafacil.site/"; // URL Produção
  }

  static getImageBaseURL() {
    return _getBaseURL() + "uploads/";
  }

  static _getApiKey() {
    return "RFAPP_012025_DEV";
  }

  static _getAuthToken() {
    return "RFAPP_012625_TKN";
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

  Future<Response> post(String path, {dynamic data, dynamic headers}) async {
    try {
      return await _dio.post(path, data: data, options: Options(headers: headers));
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
      log('DioError: ${error.response?.statusCode} - ${error.response?.data}');
    } else {
      log('Error: $error');
    }
  }
}
