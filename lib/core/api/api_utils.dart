import 'package:app_marvel/core/models/result_model.dart';
import 'package:app_marvel/ui/utils/constants/general.dart';
import 'package:dio/dio.dart';

enum Method{
  get,
}


class ApiUtils{

  final Dio _client;
  final String _host;
  final String Function()? _sessionId;

  ApiUtils({
    required Dio client,
    required String host,
    required String Function()? sessionId,
  }) : _client = client,
      _host =host,
      _sessionId = sessionId;


  Future<Result<dynamic, BackendError>> makeRequest({
    dynamic data,
    Map<String, dynamic>? headers,
    required Method method,
    required String path,
    Map<String, dynamic>? queryParameters,
  })async{
    
    Map<String, dynamic> headers = <String, dynamic>{};

    //HERE ADD TO HEADER BEARER AUTHORIZATION TOKEN
    if(_sessionId != null){
      headers[kAuthorizationKey] = 'Bearer ${_sessionId!()}';
    }

    headers.addAll(headers);

    Uri uri = Uri.https(_host, path, queryParameters);

    

    final Options options = Options(
      headers: headers
    );
    final Response response;
    try {
      switch (method) {
        case Method.get:
          response = await _client.getUri(
            uri,
            options: options,
          );
          break;
      }
      return Result.success(response.data);
    } on DioException catch (error) {
      switch (error.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return Result.fail(
            BackendError(
              statusCode: 408,
              error: 'Timeout',
              description: error.message,
            )
          );
        default:
        return Result.fail(
          BackendError(
            statusCode: error.response?.statusCode ?? -1,
            data: error.response?.data,
            description: error.response?.data.toString(),
            error: error.error.toString()
          )
        );
      }
    }

  }




}