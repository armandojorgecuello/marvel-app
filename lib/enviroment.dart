
import 'package:app_marvel/ui/utils/constansts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  
  static String get filenName => kReleaseMode ? '.env.production' : '.env.development';
  static String get  publicAPIKey => dotenv.env['PUBLICAPIKEY'] ?? kEmptyString;
  static String get  privateAPIKey => dotenv.env['PRIVATEKEY'] ?? kEmptyString;

}