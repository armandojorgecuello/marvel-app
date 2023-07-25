
import 'package:app_marvel/core/data_source/marvel_app_datasource.dart';
import 'package:app_marvel/core/entities/comic.dart';
import 'package:app_marvel/core/entities/creators/creator_comic.dart';
import 'package:app_marvel/core/models/result_model.dart';
import 'package:app_marvel/core/repositories/impl_marvel_app_repository.dart';

class MarvelAppRepository extends IMarvelAppRepository{
  
  MarvelAppRepository({
    required MarvelAppDataSource marvelAppDataSource
  }) : _marvelAppDataSource = marvelAppDataSource;
  
  final MarvelAppDataSource _marvelAppDataSource;

  @override
  Future<Result<Comic, BackendError>> getComics({required String page, String? query, String? filterSelected}) async{
    final result = await _marvelAppDataSource.getComics(page: page, query:query, filterSelected: filterSelected);
    return result.when(
      fail: (fail)=> Fail(fail), 
      success: (success)=> Success(success.toEntity())
    );
  }
  
  @override
  Future<Result<CreatorComics, BackendError>> getComicsCreators({required String comicId}) async{
    final result = await _marvelAppDataSource.getComicsCreators(comicID: comicId);
    return result.when(
      fail: (fail)=> Fail(fail), 
      success: (success)=> Success(success.toEntity())
    );
  }

}