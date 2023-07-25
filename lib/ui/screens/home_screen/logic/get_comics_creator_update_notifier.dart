import 'package:app_marvel/core/entities/creators/creator_comic.dart';
import 'package:app_marvel/core/entities/result_satate.dart';
import 'package:app_marvel/core/models/result_model.dart';
import 'package:app_marvel/core/use_case/get_comics_creator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetComicsCreatorUpdateNotifier extends StateNotifier<ResultState<CreatorComics, BackendError>>{

  GetComicsCreatorUpdateNotifier({
    required GetComicsCreatorUseCase getComicsCreatorUseCase,
  }) : _getComicsCreatorUseCase = getComicsCreatorUseCase, 
    super(ResultState.initial());

  final GetComicsCreatorUseCase _getComicsCreatorUseCase;

  Future<void> getComicsCretors({required String comicId, })async{
    state = ResultState.loading();
    final response = await _getComicsCreatorUseCase.call(comicId: comicId);
    state = response.when(
      fail: (fail) => ResultState.error(fail), 
      success: (success)=> ResultState.data(success)
    );
  }
  
}