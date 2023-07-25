import 'package:app_marvel/core/entities/comic.dart';
import 'package:app_marvel/core/entities/result_satate.dart';
import 'package:app_marvel/core/models/result_model.dart';
import 'package:app_marvel/core/use_case/get_comics_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetComicsUpdateNotifier extends StateNotifier<ResultState<Comic, BackendError>>{

  GetComicsUpdateNotifier({
    required GetComicsUseCase getComicsUseCase,
  }) : _getComicsUseCase = getComicsUseCase, 
    super(ResultState.initial());

  final GetComicsUseCase _getComicsUseCase;

  Future<void> getComics({required String page, String? query, String? filterSelected })async{
    state = ResultState.loading();
    final response = await _getComicsUseCase.call(page: page, query: query, filterSelected: filterSelected,);
    state = response.when(
      fail: (fail) => ResultState.error(fail), 
      success: (success)=> ResultState.data(success)
    );
  }
  
}