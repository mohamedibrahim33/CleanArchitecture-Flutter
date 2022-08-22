import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failure.dart';

abstract class LangRepository {
  Future<Either<Failure, bool>> changeLang({required String lang});
  Future<Either<Failure, String>> getSavedLang();
}
