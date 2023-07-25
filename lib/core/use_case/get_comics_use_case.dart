
import 'package:app_marvel/core/entities/comic.dart';
import 'package:app_marvel/core/models/result_model.dart';
import 'package:app_marvel/core/repositories/impl_marvel_app_repository.dart';

class GetComicsUseCase{

  final IMarvelAppRepository _iMarvelAppRepository;

  GetComicsUseCase({
    required IMarvelAppRepository iMarvelAppRepository
  }) : _iMarvelAppRepository = iMarvelAppRepository;


  Future<Result<Comic, BackendError>> call({required String page, String? query, String? filterSelected})
    async => _iMarvelAppRepository.getComics(page: page, query: query, filterSelected: filterSelected);

}