
import 'package:app_marvel/core/entities/creators/creator_comic.dart';
import 'package:app_marvel/core/entities/entities.dart';
import 'package:app_marvel/core/models/result_model.dart';

abstract class IMarvelAppRepository{

  Future<Result<Comic, BackendError>> getComics({required String page, String? query, String? filterSelected});
  Future<Result<CreatorComics, BackendError>> getComicsCreators({required String comicId});

} 