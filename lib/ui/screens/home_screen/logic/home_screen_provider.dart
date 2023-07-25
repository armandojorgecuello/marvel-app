
import 'package:app_marvel/core/dependencies/marvel_app_providers.dart';
import 'package:app_marvel/core/entities/creators/creator_comic.dart';
import 'package:app_marvel/core/entities/entities.dart';
import 'package:app_marvel/core/entities/result_satate.dart';
import 'package:app_marvel/core/models/result_model.dart';
import 'package:app_marvel/ui/screens/home_screen/logic/get_comic_update_notifier.dart';
import 'package:app_marvel/ui/screens/home_screen/logic/get_comics_creator_update_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getComicsUpdateNotifier = StateNotifierProvider<GetComicsUpdateNotifier, ResultState<Comic,BackendError>>((ref) 
  => GetComicsUpdateNotifier(
    getComicsUseCase: ref.watch(getComicsUseCaseProvider)
  )
);

final getComicsCreatorUpdateNotifier = StateNotifierProvider<GetComicsCreatorUpdateNotifier, ResultState<CreatorComics,BackendError>>((ref) 
  => GetComicsCreatorUpdateNotifier(
    getComicsCreatorUseCase: ref.watch(getComicsCreatorUseCaseProvider)
  )
);


final filterSelectedProvider = StateProvider<String>((ref) => '');

final pageScrollProvider = StateProvider<int>((ref) => 0);

final loadInitialDataProvider = StateProvider<bool>((ref) => true);

final showButtonProvider = StateProvider<bool>((ref) => false);

final listComicProvider = StateProvider<List<ComicResult>>((ref) => []);

final queryProvider = StateProvider<String>((ref) => '');