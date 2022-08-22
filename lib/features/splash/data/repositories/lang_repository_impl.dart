import 'package:quotes/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:quotes/features/splash/domain/repositories/lang_repository.dart';

import '../../../../core/errors/exceptions.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String lang}) async {
    try {
      final langIsChanged = await langLocalDataSource.changeLang(lang: lang);
      return right(langIsChanged);
    } on CacheException {
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return right(langCode);
    } on CacheException {
      return left(CacheFailure());
    }
  }
}
