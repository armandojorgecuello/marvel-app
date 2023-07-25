import 'package:app_marvel/core/api/api_utils.dart';
import 'package:app_marvel/enviroment.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientProvider  = Provider((ref) => Dio()); 

final marvelAPIProvider = Provider(
  (ref) => ApiUtils(
    client: ref.watch(clientProvider), 
    host: Enviroment.marvelAPIHost, 
    ///Here you can send the user token in case you need authentication validation.
    sessionId: null
  ) 
);