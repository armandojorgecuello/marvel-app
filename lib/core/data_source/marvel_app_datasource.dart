
import 'package:app_marvel/core/api/api_utils.dart';
import 'package:app_marvel/core/models/comic_model.dart';
import 'package:app_marvel/core/models/creators_model/creator_comic_model.dart';
import 'package:app_marvel/core/models/result_model.dart';
import 'package:app_marvel/enviroment.dart';
import 'package:app_marvel/ui/utils/generate_hash.dart';


const String _kMarvelAppPathV1 = '/v1/public';

class MarvelAppDataSource{

  final ApiUtils _apiUtils;

  MarvelAppDataSource({
    required ApiUtils apiUtils,
  }) : _apiUtils = apiUtils;


  Future<Result<ComicModel, BackendError>> getComics({required String page, String? query, String? filterSelected })async{
    final publicKey = Enviroment.publicAPIKey;
    final privateKey = Enviroment.privateAPIKey;
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = GeneraHASH().generateHash(timestamp, privateKey, publicKey);
    final queryParameters = {
      'apikey' : Enviroment.publicAPIKey,
      'hash' :hash,
      'ts': timestamp,
      'limit': '20',
      'offset': page,
      if(filterSelected != null)
      'format' : filterSelected,
      if(query != null)
      'titleStartsWith' : query
    };
    const String path = "$_kMarvelAppPathV1/comics";
    Result<dynamic, BackendError> result = await _apiUtils.makeRequest(
      method: Method.get, 
      path: path,
      queryParameters: queryParameters
    );
    return result.when(
      fail: (fail)=> Fail(fail),
      success: (success)=> Success(ComicModel.fromJson(success))
    );
  }

  Future<Result<CreatorComicsModel, BackendError>> getComicsCreators({required String comicID,})async{
    final publicKey = Enviroment.publicAPIKey;
    final privateKey = Enviroment.privateAPIKey;
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = GeneraHASH().generateHash(timestamp, privateKey, publicKey);
    final queryParameters = {
      'apikey' : Enviroment.publicAPIKey,
      'hash' :hash,
      'ts': timestamp,
    };
    String path = "$_kMarvelAppPathV1/comics/$comicID/creators";
    Result<dynamic, BackendError> result = await _apiUtils.makeRequest(
      method: Method.get, 
      path: path,
      queryParameters: queryParameters
    );
    return result.when(
      fail: (fail)=> Fail(fail),
      success: (success)=> Success(CreatorComicsModel.fromJson(success))
    );
  }


}