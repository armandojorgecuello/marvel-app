
import 'package:app_marvel/core/entities/creators/creator_comic.dart';
import 'package:app_marvel/core/models/result_model.dart';
import 'package:app_marvel/core/repositories/impl_marvel_app_repository.dart';

class GetComicsCreatorUseCase{

  final IMarvelAppRepository _iMarvelAppRepository;

  GetComicsCreatorUseCase({
    required IMarvelAppRepository iMarvelAppRepository
  }) : _iMarvelAppRepository = iMarvelAppRepository;


  Future<Result<CreatorComics, BackendError>> call({required String comicId, })
    async => _iMarvelAppRepository.getComicsCreators(comicId:comicId);

}