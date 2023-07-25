import 'package:app_marvel/core/data_source/marvel_app_datasource.dart';
import 'package:app_marvel/core/dependencies/api_provider.dart';
import 'package:app_marvel/core/repositories/marvel_app_repository.dart';
import 'package:app_marvel/core/use_case/get_comics_creator.dart';
import 'package:app_marvel/core/use_case/get_comics_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final marvelDataSource = Provider((ref) 
  => MarvelAppDataSource(apiUtils: ref.watch(marvelAPIProvider)) 
);

final marvelRepository = Provider((ref) 
  => MarvelAppRepository(marvelAppDataSource: ref.watch(marvelDataSource))
);

final getComicsUseCaseProvider = Provider((ref) 
  => GetComicsUseCase(
     iMarvelAppRepository: ref.watch(marvelRepository)
  )
);

final getComicsCreatorUseCaseProvider = Provider((ref) 
  => GetComicsCreatorUseCase(
     iMarvelAppRepository: ref.watch(marvelRepository)
  )
);